param(
    [string]$SourceDir = "C:\COMICS\Approved\Comic Pages",
    [string]$NotebookName = "Approved Comics Reader",
    [string]$SectionName = "Approved Comics",
    [double]$DisplayWidth = 700.0,
    [switch]$ForceRefresh
)

$ErrorActionPreference = "Stop"

if ([Threading.Thread]::CurrentThread.ApartmentState -ne "STA") {
    $argsList = @(
        "-STA",
        "-NoProfile",
        "-ExecutionPolicy", "Bypass",
        "-File", $PSCommandPath,
        "-SourceDir", $SourceDir,
        "-NotebookName", $NotebookName,
        "-SectionName", $SectionName,
        "-DisplayWidth", $DisplayWidth
    )
    if ($ForceRefresh) {
        $argsList += "-ForceRefresh"
    }
    & powershell.exe @argsList
    exit $LASTEXITCODE
}

Add-Type -AssemblyName System.Drawing

function ConvertTo-ReaderTitle {
    param(
        [int]$Index,
        [string]$FileNameWithoutExtension
    )

    $text = $FileNameWithoutExtension
    $text = $text -replace "-approved-\d{4}-\d{2}-\d{2}$", ""
    $text = $text -replace "-v\d+$", ""
    $text = $text -replace "^chapter-\d+-page-\d+-", ""
    $text = $text -replace "^dictionary-\d+-", ""
    $text = $text -replace "around-heres", "around-here"
    $text = $text -replace "-", " "
    $text = $text.Trim().ToLowerInvariant()

    $culture = [Globalization.CultureInfo]::CurrentCulture
    $title = $culture.TextInfo.ToTitleCase($text)
    return ("{0:000} - {1}" -f $Index, $title)
}

function Test-OneNotePageHasImage {
    param(
        [object]$OneNote,
        [string]$PageId
    )

    $content = ""
    $OneNote.GetPageContent($PageId, [ref]$content, 7)
    return ($content -like "*<one:Image*" -and $content -like "*<one:Data*")
}

function Set-OneNoteImagePage {
    param(
        [object]$OneNote,
        [string]$PageId,
        [string]$Title,
        [string]$ImagePath,
        [double]$DisplayWidth
    )

    $bytes = [IO.File]::ReadAllBytes($ImagePath)
    $base64 = [Convert]::ToBase64String($bytes)

    $image = [System.Drawing.Image]::FromFile($ImagePath)
    try {
        $displayHeight = [Math]::Round($image.Height * ($DisplayWidth / $image.Width), 2)
    }
    finally {
        $image.Dispose()
    }

    $now = (Get-Date).ToUniversalTime().ToString("s") + "Z"
    $pageXml = @"
<?xml version="1.0"?>
<one:Page xmlns:one="http://schemas.microsoft.com/office/onenote/2013/onenote" ID="$PageId" name="$Title" dateTime="$now" lastModifiedTime="$now" pageLevel="1" lang="en-US">
  <one:Title lang="en-US"><one:OE><one:T><![CDATA[$Title]]></one:T></one:OE></one:Title>
  <one:Outline>
    <one:Position x="36.0" y="86.4" z="0"/>
    <one:OEChildren>
      <one:OE>
        <one:Image format="png">
          <one:Size width="$DisplayWidth" height="$displayHeight"/>
          <one:Data>$base64</one:Data>
        </one:Image>
      </one:OE>
    </one:OEChildren>
  </one:Outline>
</one:Page>
"@

    $OneNote.UpdatePageContent($pageXml)
}

if (-not (Test-Path -LiteralPath $SourceDir)) {
    throw "Approved comic page folder was not found: $SourceDir"
}

$sourceFiles = Get-ChildItem -LiteralPath $SourceDir -File -Filter *.png | Sort-Object Name
if (-not $sourceFiles) {
    throw "No approved PNG files found in: $SourceDir"
}

$oneNote = New-Object -ComObject OneNote.Application
$rootXml = ""
$oneNote.GetHierarchy("", 4, [ref]$rootXml)
[xml]$root = $rootXml

$notebook = $root.Notebooks.Notebook | Where-Object { $_.name -eq $NotebookName } | Select-Object -First 1
if (-not $notebook) {
    throw "OneNote notebook is not open: $NotebookName"
}

$notebookXml = ""
$oneNote.GetHierarchy($notebook.ID, 4, [ref]$notebookXml)
[xml]$notebookHierarchy = $notebookXml

$section = $notebookHierarchy.Notebook.Section | Where-Object { $_.name -eq $SectionName } | Select-Object -First 1
if (-not $section) {
    throw "OneNote section was not found: $NotebookName > $SectionName"
}

$existingPages = @($section.Page)
$results = New-Object System.Collections.Generic.List[object]
$desiredTitles = New-Object System.Collections.Generic.HashSet[string]

for ($i = 0; $i -lt $sourceFiles.Count; $i++) {
    $file = $sourceFiles[$i]
    $title = ConvertTo-ReaderTitle -Index ($i + 1) -FileNameWithoutExtension $file.BaseName
    [void]$desiredTitles.Add($title)

    $page = $existingPages | Where-Object { $_.name -eq $title } | Select-Object -First 1
    if ($page) {
        $hasImage = Test-OneNotePageHasImage -OneNote $oneNote -PageId $page.ID
        if ($hasImage -and -not $ForceRefresh) {
            $results.Add([pscustomobject]@{
                Action = "Already present"
                Page = $title
                Source = $file.Name
            })
            continue
        }

        Set-OneNoteImagePage -OneNote $oneNote -PageId $page.ID -Title $title -ImagePath $file.FullName -DisplayWidth $DisplayWidth
        $results.Add([pscustomobject]@{
            Action = if ($ForceRefresh) { "Refreshed" } else { "Rebuilt missing image" }
            Page = $title
            Source = $file.Name
        })
        continue
    }

    $newPageId = ""
    $oneNote.CreateNewPage($section.ID, [ref]$newPageId, 0)
    Set-OneNoteImagePage -OneNote $oneNote -PageId $newPageId -Title $title -ImagePath $file.FullName -DisplayWidth $DisplayWidth
    $results.Add([pscustomobject]@{
        Action = "Inserted"
        Page = $title
        Source = $file.Name
    })
}

try {
    $oneNote.SyncHierarchy($notebook.ID)
}
catch {
    Write-Warning "OneNote sync command returned a warning: $($_.Exception.Message)"
}

$extraPages = @($existingPages | Where-Object { -not $desiredTitles.Contains($_.name) } | ForEach-Object { $_.name })

[pscustomobject]@{
    Notebook = $NotebookName
    Section = $SectionName
    ApprovedSourceImages = $sourceFiles.Count
    ExtraOneNotePagesNotRemoved = $extraPages.Count
} | Format-List

$results | Format-Table -AutoSize

if ($extraPages.Count -gt 0) {
    Write-Host ""
    Write-Host "Extra OneNote pages were detected but not removed:"
    $extraPages | ForEach-Object { Write-Host " - $_" }
}
