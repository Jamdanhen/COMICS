param(
    [string]$SourceDir = "C:\COMICS\Approved\Comic Pages",
    [string]$NotebookName = "Comics",
    [string]$SectionName = "Approved Comics",
    [double]$DisplayWidth = 700.0,
    [int]$PhoneImagePixelWidth = 900,
    [int]$PhoneImageMaxPixelHeight = 1600,
    [long]$JpegQuality = 72,
    [switch]$ForceRebuild,
    [switch]$RemoveExtraPages
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
        "-DisplayWidth", $DisplayWidth,
        "-PhoneImagePixelWidth", $PhoneImagePixelWidth,
        "-PhoneImageMaxPixelHeight", $PhoneImageMaxPixelHeight,
        "-JpegQuality", $JpegQuality
    )
    if ($ForceRebuild) {
        $argsList += "-ForceRebuild"
    }
    if ($RemoveExtraPages) {
        $argsList += "-RemoveExtraPages"
    }
    & powershell.exe @argsList
    exit $LASTEXITCODE
}

Add-Type -AssemblyName System.Drawing

function Get-ApprovedComicEntries {
    param(
        [string]$SourceDir
    )

    if (-not (Test-Path -LiteralPath $SourceDir)) {
        throw "Approved comic page folder was not found: $SourceDir"
    }

    $files = @(Get-ChildItem -LiteralPath $SourceDir -File -Filter *.png | Sort-Object Name)
    if ($files.Count -eq 0) {
        throw "No approved PNG files found in: $SourceDir"
    }

    $entries = New-Object System.Collections.Generic.List[object]
    for ($i = 0; $i -lt $files.Count; $i++) {
        $file = $files[$i]
        $entries.Add([pscustomobject]@{
            Index = $i + 1
            PageTitle = $file.Name
            FileName = $file.Name
            SourcePath = $file.FullName
        })
    }

    return $entries
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
        [double]$DisplayWidth,
        [int]$PhoneImagePixelWidth,
        [int]$PhoneImageMaxPixelHeight,
        [long]$JpegQuality
    )

    $sourceImage = [System.Drawing.Image]::FromFile($ImagePath)
    try {
        $scale = [Math]::Min(1.0, [Math]::Min($PhoneImagePixelWidth / $sourceImage.Width, $PhoneImageMaxPixelHeight / $sourceImage.Height))
        $targetWidth = [Math]::Max(1, [Math]::Round($sourceImage.Width * $scale))
        $targetHeight = [Math]::Max(1, [Math]::Round($sourceImage.Height * $scale))
        $bitmap = New-Object System.Drawing.Bitmap $targetWidth, $targetHeight, ([System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        $graphics.Clear([System.Drawing.Color]::White)
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.DrawImage($sourceImage, 0, 0, $targetWidth, $targetHeight)
        $graphics.Dispose()

        $jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" } | Select-Object -First 1
        $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters 1
        $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality), $JpegQuality
        $stream = New-Object System.IO.MemoryStream
        $bitmap.Save($stream, $jpegCodec, $encoderParams)
        $bytes = $stream.ToArray()
        $stream.Dispose()
        $bitmap.Dispose()

        $base64 = [Convert]::ToBase64String($bytes)
        $displayHeight = [Math]::Round($targetHeight * ($DisplayWidth / $targetWidth), 2)
    }
    finally {
        $sourceImage.Dispose()
    }

    $xmlTitle = [Security.SecurityElement]::Escape($Title)
    $now = (Get-Date).ToUniversalTime().ToString("s") + "Z"
    $pageXml = @"
<?xml version="1.0"?>
<one:Page xmlns:one="http://schemas.microsoft.com/office/onenote/2013/onenote" ID="$PageId" name="$xmlTitle" dateTime="$now" lastModifiedTime="$now" pageLevel="1" lang="en-US">
  <one:Title lang="en-US"><one:OE><one:T><![CDATA[$Title]]></one:T></one:OE></one:Title>
  <one:Outline>
    <one:Position x="36.0" y="86.4" z="0"/>
    <one:OEChildren>
      <one:OE>
        <one:Image format="jpg">
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

$entries = @(Get-ApprovedComicEntries -SourceDir $SourceDir)

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
$usedPageIds = New-Object System.Collections.Generic.HashSet[string]
$deletedPageIds = New-Object System.Collections.Generic.HashSet[string]
$results = New-Object System.Collections.Generic.List[object]

for ($i = 0; $i -lt $entries.Count; $i++) {
    $entry = $entries[$i]
    $page = $existingPages | Where-Object { $_.name -eq $entry.PageTitle } | Select-Object -First 1
    $action = "Already present"

    if (-not $page) {
        $newPageId = ""
        $oneNote.CreateNewPage($section.ID, [ref]$newPageId, 0)
        $page = [pscustomobject]@{ ID = $newPageId; name = $entry.PageTitle }
        $action = "Inserted"
    }
    elseif ($ForceRebuild) {
        $oneNote.DeleteHierarchy($page.ID)
        [void]$deletedPageIds.Add($page.ID)
        $newPageId = ""
        $oneNote.CreateNewPage($section.ID, [ref]$newPageId, 0)
        $page = [pscustomobject]@{ ID = $newPageId; name = $entry.PageTitle }
        $action = "Recreated for phone"
    }

    [void]$usedPageIds.Add($page.ID)

    $hasImage = $false
    if ($action -eq "Already present") {
        $hasImage = Test-OneNotePageHasImage -OneNote $oneNote -PageId $page.ID
    }

    if ($action -ne "Already present" -or -not $hasImage) {
        Set-OneNoteImagePage -OneNote $oneNote -PageId $page.ID -Title $entry.PageTitle -ImagePath $entry.SourcePath -DisplayWidth $DisplayWidth -PhoneImagePixelWidth $PhoneImagePixelWidth -PhoneImageMaxPixelHeight $PhoneImageMaxPixelHeight -JpegQuality $JpegQuality
        if ($action -eq "Already present") {
            $action = "Rebuilt missing image"
        }
    }

    $results.Add([pscustomobject]@{
        Action = $action
        Page = $entry.PageTitle
        Source = $entry.FileName
    })
}

$extraPages = @($existingPages | Where-Object { -not $usedPageIds.Contains($_.ID) -and -not $deletedPageIds.Contains($_.ID) })
$removedPages = New-Object System.Collections.Generic.List[string]

if ($RemoveExtraPages) {
    foreach ($page in $extraPages) {
        try {
            $oneNote.DeleteHierarchy($page.ID)
            $removedPages.Add($page.name)
        }
        catch {
            Write-Warning "Could not remove extra OneNote page '$($page.name)': $($_.Exception.Message)"
        }
    }
    $extraPages = @($extraPages | Where-Object { -not $removedPages.Contains($_.name) })
}

try {
    $oneNote.SyncHierarchy($notebook.ID)
}
catch {
    Write-Warning "OneNote sync command returned a warning: $($_.Exception.Message)"
}

[pscustomobject]@{
    Notebook = $NotebookName
    Section = $SectionName
    ApprovedSourceImages = $entries.Count
    ExtraOneNotePagesNotRemoved = $extraPages.Count
    ExtraOneNotePagesRemoved = $removedPages.Count
} | Format-List

$results | Format-Table -AutoSize

if ($extraPages.Count -gt 0) {
    Write-Host ""
    Write-Host "Extra OneNote pages were detected but not removed:"
    $extraPages | ForEach-Object { Write-Host " - $($_.name)" }
}

if ($removedPages.Count -gt 0) {
    Write-Host ""
    Write-Host "Extra OneNote pages removed:"
    $removedPages | ForEach-Object { Write-Host " - $_" }
}
