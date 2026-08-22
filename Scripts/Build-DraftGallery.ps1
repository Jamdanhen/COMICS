param(
    [string]$ProjectRoot = 'C:\COMICS'
)

$ErrorActionPreference = 'Stop'

$galleryDirectory = Join-Path $ProjectRoot 'Working\Draft-Gallery'
$outputPath = Join-Path $galleryDirectory 'index.html'
$generatedDirectory = Join-Path $ProjectRoot 'Images\Generated'
$editsDirectory = Join-Path $ProjectRoot 'Images\Edits'

New-Item -ItemType Directory -Path $galleryDirectory -Force | Out-Null

function Encode-Html([string]$Value) {
    return [System.Net.WebUtility]::HtmlEncode($Value)
}

function Get-RelativeUrl([string]$Path) {
    $baseUri = [Uri]($galleryDirectory.TrimEnd('\') + '\')
    return $baseUri.MakeRelativeUri([Uri]$Path).ToString()
}

function Get-FileUrl([string]$Path) {
    return ([Uri]$Path).AbsoluteUri
}

function New-VisualCard($Item) {
    $path = Join-Path $ProjectRoot $Item.Path
    if (-not (Test-Path -LiteralPath $path)) {
        return @"
<article class="card missing" data-search="$(Encode-Html (($Item.Title + ' ' + $Item.Status + ' missing').ToLowerInvariant()))">
  <div class="missing-image">Image missing</div>
  <div class="card-body">
    <h3>$(Encode-Html $Item.Title)</h3>
    <p class="status">$(Encode-Html $Item.Status)</p>
    <p>$(Encode-Html $Item.Note)</p>
    <code>$(Encode-Html $path)</code>
  </div>
</article>
"@
    }

    $imageUrl = Get-RelativeUrl $path
    $fileUrl = Get-FileUrl $path
    $recordMarkup = ''
    if ($Item.Record) {
        $recordPath = Join-Path $ProjectRoot $Item.Record
        if (Test-Path -LiteralPath $recordPath) {
            $recordMarkup = '<a class="secondary" href="' + (Get-FileUrl $recordPath) + '">Open status record</a>'
        }
    }

    return @"
<article class="card" data-search="$(Encode-Html (($Item.Title + ' ' + $Item.Status + ' ' + $Item.Note).ToLowerInvariant()))">
  <a class="thumb" href="$fileUrl"><img src="$imageUrl" alt="$(Encode-Html $Item.Title)" loading="lazy"></a>
  <div class="card-body">
    <h3>$(Encode-Html $Item.Title)</h3>
    <p class="status">$(Encode-Html $Item.Status)</p>
    <p>$(Encode-Html $Item.Note)</p>
    <div class="actions"><a href="$fileUrl">Open original</a>$recordMarkup</div>
    <code>$(Encode-Html $Item.Path)</code>
  </div>
</article>
"@
}

function New-WrittenCard($Item) {
    $sourcePath = Join-Path $ProjectRoot $Item.Source
    $sourceMarkup = ''
    if (Test-Path -LiteralPath $sourcePath) {
        $sourceMarkup = '<a href="' + (Get-FileUrl $sourcePath) + '">Open source note</a>'
    }

    return @"
<article class="written-card" data-search="$(Encode-Html (($Item.Title + ' ' + $Item.Status + ' ' + $Item.Meaning).ToLowerInvariant()))">
  <h3>$(Encode-Html $Item.Title)</h3>
  <p class="status">$(Encode-Html $Item.Status)</p>
  <p>$(Encode-Html $Item.Meaning)</p>
  $sourceMarkup
</article>
"@
}

$almostFinished = @(
    [pscustomobject]@{
        Title = 'Around Here Town Hall: Interestingness'
        Status = 'Accepted final draft, not approved'
        Note = 'Completed draft version held outside the approved comic sequence.'
        Path = 'Images\Generated\draft-single-panel-around-here-town-hall-interestingness-2026-08-01-v5.png'
        Record = 'Working\committee-representative-portfolio-plan-2026-07-20.md'
    },
    [pscustomobject]@{
        Title = 'SASMG Workplace Comic'
        Status = 'Corrected continuity draft, not approved'
        Note = 'Current workplace-mode direction with Razorforge identity corrections.'
        Path = 'Images\Generated\workplace-comic-sasmg-razorforge-draft-002.png'
        Record = 'Scripts\workplace-comic-sasmg-razorforge-draft-001.md'
    },
    [pscustomobject]@{
        Title = 'Project Process Machine'
        Status = 'Draft direction, not approved'
        Note = 'Main mythology process scene using physical ore, tracks, sorting, decision, action, and review.'
        Path = 'Images\Generated\project-process-machine-visual-draft-001.png'
        Record = 'Scripts\project-process-machine-visual-draft-001.md'
    },
    [pscustomobject]@{
        Title = 'Around Here Topographical Map'
        Status = 'Saved map draft, not approved canon'
        Note = 'Conceptual territory rendered as an old scroll-style map.'
        Path = 'Images\Generated\candidate-around-here-topographical-map-2026-07-05-v1.png'
        Record = 'Working\draft-around-here-topographical-map-2026-07-05.md'
    }
)

$symbolDrafts = @(
    [pscustomobject]@{
        Title = 'Mythic Beam'
        Status = 'Working visual candidate, deferred'
        Note = 'Approved meaning with an unresolved final visual form. This is the stronger second candidate.'
        Path = 'Images\Generated\candidate-symbol-mythic-beam-2026-07-19-v2.png'
        Record = 'Source\Language\approved-vocabulary-index.md'
    },
    [pscustomobject]@{
        Title = 'Around Here Sign'
        Status = 'Working visual concept'
        Note = 'A jurisdiction sign that confirms arrival without providing useful location information.'
        Path = 'Images\Generated\generated-2026-07-04-around-here-sign-concept-v1.png'
        Record = 'Working\visual-concept-around-here-sign-2026-07-04.md'
    }
)

$writtenOnly = @(
    [pscustomobject]@{ Title='The Crate'; Status='Strong candidate'; Meaning='Classified information or unknown contents.'; Source='Source\References\around-here-comic-dictionary-candidate-symbol-register-v0-1.md' },
    [pscustomobject]@{ Title='Code Block'; Status='Emerging'; Meaning='Unread signal or potential information requiring translation.'; Source='Source\References\around-here-comic-dictionary-candidate-symbol-register-v0-1.md' },
    [pscustomobject]@{ Title='Noodle Shop'; Status='Derivative candidate'; Meaning='A possible location extending Noodle language, not the primary Noodle symbol.'; Source='Source\Canon\noodle-bowl-canon.md' },
    [pscustomobject]@{ Title='Biological Committee Notice Design'; Status='Working design problem'; Meaning='A distinct visual form for biological reminders without excessive labeling.'; Source='Working\symbol-candidate-notes-chronicle-monocle-gazelle-biological-committee.md' },
    [pscustomobject]@{ Title='Comedy Standards Notice Design'; Status='Working design problem'; Meaning='A distinct fine or notice form for comedic violations.'; Source='Working\symbol-candidate-notes-chronicle-monocle-gazelle-biological-committee.md' },
    [pscustomobject]@{ Title='Archive Visual Form'; Status='Deferred visual candidate'; Meaning='The meaning is valid, but its repeatable appearance remains open.'; Source='Source\Canon\concept-language-update-2026-06-09.md' },
    [pscustomobject]@{ Title='No-Write Boundary'; Status='Deferred visual candidate'; Meaning='Review or staging does not automatically authorize durable archive changes.'; Source='Source\Canon\concept-language-update-2026-06-09.md' },
    [pscustomobject]@{ Title='Human-Facing Control Panel'; Status='Deferred visual candidate'; Meaning='A usable Taskmaster control surface without machine burden.'; Source='Source\Language\language-core-terms.md' },
    [pscustomobject]@{ Title='Crucible / Lost City Visual Form'; Status='Visual form open'; Meaning='Approved high-level concept whose final repeatable appearance remains unresolved.'; Source='Source\Canon\concept-language-update-2026-06-09.md' },
    [pscustomobject]@{ Title='Play-Doh'; Status='Parked / observe'; Meaning='Possible interoperability connector; currently too broad.'; Source='Source\References\around-here-comic-dictionary-candidate-symbol-register-v0-1.md' },
    [pscustomobject]@{ Title='The Cyborg'; Status='Parked / observe'; Meaning='Human and system integration; premature to define.'; Source='Source\References\around-here-comic-dictionary-candidate-symbol-register-v0-1.md' },
    [pscustomobject]@{ Title='Spiral Noodle'; Status='Parked / observe'; Meaning='Possible recursion or escalating-complexity symbol.'; Source='Source\Canon\noodle-bowl-canon.md' },
    [pscustomobject]@{ Title='Naval Mine / Dormant Significance'; Status='Proposed, not promoted'; Meaning='Dormant significance, distinct from the underground Mine. It has appeared only inside development artwork.'; Source='Working\proposed-symbol-naval-mine-dormant-significance-2026-06-14.md' },
    [pscustomobject]@{ Title='Quantum Noodle'; Status='Deferred, not promoted'; Meaning='A parked Noodle variation without a standalone visual candidate.'; Source='Source\Canon\noodle-bowl-canon.md' },
    [pscustomobject]@{ Title='Noodle Sub-Comic Characters'; Status='Parked'; Meaning='Possible rare sub-comic figures, not active main-language symbols.'; Source='Source\Canon\noodle-bowl-canon.md' }
)

$approvedOrCurrentNames = @(
    'comic-000a-the-usual-suspects.png',
    'comic-000b-symbol-key-volume-1-v2.png',
    'comic-001-the-fragile-detail-v3.png',
    'draft-dictionary-001-the-usual-suspects-with-chief-inspector-2026-07-04-v1.png',
    'candidate-around-here-chronicle-laundry-hydra-2026-07-05-v2.png',
    'candidate-around-here-chronicle-newsroom-laundry-hydra-2026-07-05-v3.png',
    'generated-2026-07-09-official-committee-notifications-approved.png',
    'draft-thought-bubble-to-screen-escape-v14-near-final-table-continuity-2026-06-11.png',
    'generated-2026-06-18-idea-segmentation-machine-draft-v4.png',
    'generated-2026-06-29-around-heres-most-wanted-comic-no-clown-v3.png',
    'draft-three-panel-mine-ore-taskmaster-razorforge-codex-2026-07-07-v10-full-redraw.png',
    'candidate-symbol-ham-sandwich-progression-2026-07-20-v1.png',
    'candidate-symbol-shift-clock-mine-time-clock-2026-07-04.png',
    'generated-2026-06-14-zodaks-helmet-symbol-open-chin.png',
    'character-snapshot-chief-inspector-category-fraud-2026-07-04-v2.png',
    'candidate-character-gazelle-reporter-2026-07-05-v3.png',
    'candidate-portfolio-comedic-standards-representatives-2026-07-22-v6.png',
    'candidate-portfolio-biological-committee-representatives-2026-07-24-v4.png',
    'candidate-portfolio-boundary-commission-representatives-2026-07-25-v6.png',
    'candidate-portfolio-technological-committee-apparatuses-2026-07-25-v6.png',
    'title-card-around-here-v18-sunday-comics-simple-mine-cart.svg',
    'title-card-around-here-approved-clipboard-2026-07-08.png'
)

$activeNames = @($almostFinished.Path + $symbolDrafts.Path | ForEach-Object { Split-Path $_ -Leaf })
$imageExtensions = @('.png', '.jpg', '.jpeg', '.webp', '.svg')
$historicalFiles = @()

foreach ($directory in @($generatedDirectory, $editsDirectory)) {
    if (Test-Path -LiteralPath $directory) {
        $historicalFiles += Get-ChildItem -LiteralPath $directory -Recurse -File | Where-Object {
            $imageExtensions -contains $_.Extension.ToLowerInvariant() -and
            $activeNames -notcontains $_.Name -and
            $approvedOrCurrentNames -notcontains $_.Name
        }
    }
}

$historicalFiles = $historicalFiles | Sort-Object LastWriteTime, FullName

$historicalCards = foreach ($file in $historicalFiles) {
    $relativePath = $file.FullName.Substring($ProjectRoot.Length + 1)
    $relativeUrl = Get-RelativeUrl $file.FullName
    $fileUrl = Get-FileUrl $file.FullName
    $search = ($file.Name + ' ' + $relativePath).ToLowerInvariant()
    @"
<article class="history-card" data-search="$(Encode-Html $search)">
  <a class="history-thumb" href="$fileUrl"><img src="$relativeUrl" alt="$(Encode-Html $file.Name)" loading="lazy"></a>
  <div><strong>$(Encode-Html $file.Name)</strong><code>$(Encode-Html $relativePath)</code></div>
</article>
"@
}

$almostFinishedMarkup = ($almostFinished | ForEach-Object { New-VisualCard $_ }) -join "`n"
$symbolMarkup = ($symbolDrafts | ForEach-Object { New-VisualCard $_ }) -join "`n"
$writtenMarkup = ($writtenOnly | ForEach-Object { New-WrittenCard $_ }) -join "`n"
$historyMarkup = $historicalCards -join "`n"
$generatedDate = Get-Date -Format 'yyyy-MM-dd HH:mm'

$html = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Around Here Draft Gallery</title>
  <style>
    :root { color-scheme: light; --ink:#191919; --paper:#f5f5f3; --panel:#fff; --line:#c8c8c4; --muted:#666; --soft:#e9e9e6; }
    * { box-sizing:border-box; }
    body { margin:0; color:var(--ink); background:var(--paper); font:15px/1.45 Arial, sans-serif; letter-spacing:0; }
    header { position:sticky; top:0; z-index:3; padding:14px 20px; border-bottom:1px solid var(--line); background:rgba(245,245,243,.96); }
    .header-row { display:flex; align-items:end; justify-content:space-between; gap:18px; max-width:1500px; margin:auto; }
    h1 { margin:0; font:700 25px/1.1 Georgia, serif; }
    .summary { margin:4px 0 0; color:var(--muted); }
    #search { width:min(360px,100%); height:38px; padding:8px 11px; border:1px solid #999; border-radius:3px; background:#fff; font:inherit; }
    main { max-width:1500px; margin:auto; padding:20px; }
    section { margin:0 0 30px; }
    .section-head { display:flex; align-items:baseline; gap:10px; border-bottom:2px solid var(--ink); margin-bottom:12px; }
    h2 { margin:0 0 7px; font:700 19px/1.2 Georgia, serif; }
    .count { color:var(--muted); font-size:13px; }
    .grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(300px,1fr)); gap:12px; }
    .card { min-width:0; background:var(--panel); border:1px solid var(--line); border-radius:5px; overflow:hidden; }
    .thumb { display:flex; height:230px; align-items:center; justify-content:center; background:#ededeb; border-bottom:1px solid var(--line); }
    .thumb img { width:100%; height:100%; object-fit:contain; }
    .card-body { padding:12px; }
    h3 { margin:0 0 4px; font-size:16px; }
    p { margin:5px 0 9px; }
    .status { display:inline-block; margin:0 0 6px; padding:2px 6px; background:var(--soft); border-left:3px solid #555; font-size:12px; font-weight:700; }
    .actions { display:flex; flex-wrap:wrap; gap:12px; margin:10px 0; }
    a { color:#111; text-decoration-thickness:1px; text-underline-offset:2px; }
    .secondary { color:#555; }
    code { display:block; overflow-wrap:anywhere; color:#666; font:11px/1.35 Consolas, monospace; }
    .empty { padding:18px; background:var(--panel); border:1px dashed #999; color:var(--muted); }
    .written-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(255px,1fr)); gap:10px; }
    .written-card { background:var(--panel); border:1px solid var(--line); border-left:4px solid #777; padding:11px; }
    details { background:var(--panel); border:1px solid var(--line); }
    summary { cursor:pointer; padding:12px; font-weight:700; }
    .history-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(290px,1fr)); gap:8px; padding:10px; border-top:1px solid var(--line); }
    .history-card { display:grid; grid-template-columns:82px 1fr; gap:9px; min-width:0; padding:7px; border:1px solid #ddd; background:#fafafa; }
    .history-thumb { display:flex; width:82px; height:68px; align-items:center; justify-content:center; background:#eee; }
    .history-thumb img { width:100%; height:100%; object-fit:contain; }
    .history-card strong { display:block; margin-bottom:5px; overflow-wrap:anywhere; font-size:12px; }
    .note { padding:10px 12px; border-left:4px solid #555; background:#e8e8e5; }
    [hidden] { display:none !important; }
    @media (max-width:700px) {
      header { position:static; }
      .header-row { display:block; }
      #search { margin-top:12px; width:100%; }
      main { padding:14px; }
      .grid { grid-template-columns:1fr; }
      .thumb { height:auto; min-height:180px; max-height:420px; }
      .thumb img { max-height:420px; }
    }
  </style>
</head>
<body>
  <header>
    <div class="header-row">
      <div><h1>Around Here Draft Gallery</h1><p class="summary">Pending work only, with historical versions separated below. Generated $generatedDate.</p></div>
      <input id="search" type="search" placeholder="Filter drafts and candidates" aria-label="Filter drafts and candidates">
    </div>
  </header>
  <main>
    <p class="note"><strong>Read-only index.</strong> Images remain in their original project locations. Approved comic pages and approved vocabulary references are intentionally excluded from the pending sections.</p>

    <section>
      <div class="section-head"><h2>Almost-Finished Comics</h2><span class="count">$($almostFinished.Count) live visual drafts</span></div>
      <div class="grid">$almostFinishedMarkup</div>
    </section>

    <section>
      <div class="section-head"><h2>Symbol Drafts</h2><span class="count">$($symbolDrafts.Count) standalone visual candidates</span></div>
      <div class="grid">$symbolMarkup</div>
    </section>

    <section>
      <div class="section-head"><h2>Character Drafts</h2><span class="count">0 active</span></div>
      <div class="empty">There are no active character drafts. The Chief Inspector, Gazelle Reporter, and current committee representative portfolios are accepted or approved visual-language references. Their earlier versions appear under Superseded Versions.</div>
    </section>

    <section>
      <div class="section-head"><h2>Written-Only Candidates</h2><span class="count">$($writtenOnly.Count) concepts without standalone draft images</span></div>
      <div class="written-grid">$writtenMarkup</div>
    </section>

    <section>
      <div class="section-head"><h2>Superseded Versions</h2><span class="count">$($historicalFiles.Count) historical or inactive generated images</span></div>
      <details>
        <summary>Show historical versions</summary>
        <p class="note">These files are retained as iteration history. Their presence here does not make them active candidates or canon.</p>
        <div class="history-grid">$historyMarkup</div>
      </details>
    </section>
  </main>
  <script>
    const search = document.getElementById('search');
    search.addEventListener('input', () => {
      const query = search.value.trim().toLowerCase();
      document.querySelectorAll('[data-search]').forEach(card => {
        card.hidden = query && !card.dataset.search.includes(query);
      });
    });
  </script>
</body>
</html>
"@

[System.IO.File]::WriteAllText($outputPath, $html, [System.Text.UTF8Encoding]::new($false))
Write-Output "Draft gallery written to $outputPath"
Write-Output "Active visual drafts: $($almostFinished.Count + $symbolDrafts.Count)"
Write-Output "Written-only candidates: $($writtenOnly.Count)"
Write-Output "Historical images indexed: $($historicalFiles.Count)"
