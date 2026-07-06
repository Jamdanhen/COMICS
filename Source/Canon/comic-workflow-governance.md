# Comic Workflow Governance

Status: approved

Source:

- Approved from `C:\comics\Working\proposed-comic-workflow-principles-from-campaign-project.md`
- Approval text: `APPROVE COMIC WORKFLOW PRINCIPLES`
- Visual-generation rule added from Taskmaster instruction, 2026-06-12: do not use color or realistic/hyper-realistic detail unless explicitly requested with the phrases `full color`, `realistic`, or `hyper-realistic detail`; do not produce images that drift from source documents, especially the lineup; do not stop for process questions when direction is already set.

## Core Governance

The comic project uses the user's preferred working style:

- The project folder is durable memory. Chats are useful, but approved continuity belongs in files.
- Taskmaster is the final authority for canon, visual identity, tone, approval, rejection, revision, and completion.
- Razorforge extracts, interprets, compresses, clarifies, and proposes.
- Codex builds, generates, organizes, edits, and records approved outcomes, but does not silently create canon.
- Source material should be preserved before interpretation.
- Stable facts should be recorded once and reused everywhere.
- Drafts and variants are allowed; duplicate canon is not.
- Speculation, uncertainty, and fragile details should remain labeled until approved or resolved.
- Useful fragile details should be preserved without forcing immediate canon decisions.
- Generated outputs are drafts until Taskmaster approves them.
- Approved generated outputs should be recorded with image path, prompt or script notes, source principle, and relevant visual corrections.
- Review should produce a clear outcome: approve, revise, park, or stop.
- If a process makes Taskmaster repeatedly copy, re-enter, reformat, or reconcile the same information, redesign the process.
- Human-facing outputs should be readable, clear, and immediately useful.
- When giving Taskmaster decision options, present each concrete option in a separate copyable block or in a format the interface can offer as an "add to chat" action. Avoid making Taskmaster manually highlight and copy text when a clean copy action can be supported.
- This applies to clarifying questions and small choices as well as major concept decisions. Unless the list is too long to remain usable, every presented choice should be formatted as its own copyable `CHOOSE:` block.
- For long choice lists, first present a compact shortlist or grouped menu, then expand only the selected group into full copyable `CHOOSE:` blocks. Do not force Taskmaster to scroll up and down comparing many large option descriptions.
- Failures, uncertainties, and blockers should be visible rather than silently ignored.
- Future ideas may be parked without displacing the active task.
- Use external project phases and waypoint records as a loose chronological spine and source of real events, but choose comic subjects based on behavioral meaning, symbolic strength, and reader clarity.
- Do not turn the comic into a phase-by-phase changelog. The phases orient the comic; the behavioral roles and symbolic tensions drive it.
- When Taskmaster selects a draft direction, treat that selection as a direction of travel, not automatic permission to fully execute without another check when the idea still needs shaping.
- After a meaningful concept choice, offer a brief refinement pause when useful: confirm whether Taskmaster wants to proceed directly, sharpen the angle, add source material, or redirect the emphasis.
- `ADD SOURCE MATERIAL FIRST` is a high-value branch. It allows Taskmaster to provide a story, memory, origin detail, uploaded document, visual reference, map, rough draft, workplace scene, or other source artifact before drafting.
- Source material added through this branch should be preserved first, then interpreted. It may clarify canon, strengthen recurring jokes, improve visual accuracy, or reveal the underlying behavioral pattern behind a comic concept.
- When producing behavior-focused logs, behavioral extraction outputs, or session-scoped behavior observations, place the full log output in a code block so it can be copied or moved as a single unit. This rule is about behavior capture, not ordinary decision records or choice menus.
- Before creating the behavior discussion chat export/update file, before generating a behavior log from this project, or before running a behavior extract/profile when that file is needed first, follow `C:\Comics\Source\Canon\behavior-profile-protocol.md`; check the campaign project progress records because they preserve interactions related to the extraction-project design and provide the timeline that feeds the comic timeline and behavior discussion chat.
- Version and volume numbering may become part of the project's humor when appropriate. Iterations such as `Volume 1 v2`, `Volume 2A`, or similar labels can signal that the language evolves through revision.
- Keep `Volume 1` and `Volume 2` as the core title anchors for symbol key sheets. Let the suffix, revision marker, appendix marker, or end-script carry the joke.

## Folder Behavior

- `Source/Uploads/`: raw inputs, not automatically canon.
- `Source/References/`: extracted source material and non-canon support notes.
- `Source/Canon/`: approved governing principles, process rules, and continuity.
- `Source/Characters/`: approved character identity, voice, and visual calibration.
- `Source/Language/`: approved terms, symbols, motifs, and recurring labels.
- `Scripts/`: panel logic, prompt records, approved/revised comic notes.
- `Images/Generated/`: generated draft and approved comic images.
- `Images/Edits/`: image variants and corrections.
- `Working/`: proposals, parked ideas, unresolved details, temporary drafts.
- `Exports/`: shareable final outputs.
- `Approved/Comic Pages/`: approved final comic page images after Taskmaster approval.
- `Sleeper/Approved/Comic Pages/`: phone-access mirror of `Approved/Comic Pages/`. It should match the master approved shelf exactly in filenames and image contents, but it is not a separate canon source.

## Approved Phone Mirror Rule

The master approved shelf is:

`C:\comics\Approved\Comic Pages`

The phone-access mirror is:

`C:\comics\Sleeper\Approved\Comic Pages`

When an approved comic page is added, renamed, replaced, or removed from the master approved shelf, make the same change in the Sleeper approved shelf. The Sleeper approved shelf should mirror the master shelf exactly so Taskmaster can access the approved comics from the phone without maintaining a second organization system.

## Approved Reader Packet Propagation Rule

When Taskmaster approves a comic page, approval is not complete until the reader-facing packet has been refreshed.

For each approved comic, update all applicable locations:

- `C:\COMICS\Approved\Comic Pages`
- `C:\COMICS\Sleeper\Approved\Comic Pages`
- `C:\COMICS\Sleeper\Reader_Packets\Comic Pages`
- `C:\Users\MrJam\OneDrive\Documents\Comics-Sleeper\Comic Pages`
- `C:\Users\MrJam\OneDrive\Organized Content Backup\Comics\Sleeper\Reader_Packets\Comic Pages`

Then refresh the packet files from the current approved register:

- `Approved Comics - Register.md`
- `Read Me - Approved Comics.md`
- `Start Here - Approved Comics.html`
- `Approved Comics - Reader Packet.pdf`
- `Approved Comics - OneNote Visible Reader.png`

The same refreshed packet files should exist in:

- `C:\COMICS\Sleeper\Reader_Packets`
- `C:\Users\MrJam\OneDrive\Documents\Comics-Sleeper`
- `C:\Users\MrJam\OneDrive\Organized Content Backup\Comics\Sleeper\Reader_Packets`

Before closing an approval task, verify that the approved image count matches across the master shelf, Sleeper shelf, reader packet image folder, OneDrive phone folder, and backup packet folder, and verify that every image referenced by `Start Here - Approved Comics.html` exists.

## First-Draft Comic Blocking Rule

For new multi-panel comic ideas, use rough blocking as the first draft format after the direction is discussed and chosen.

The first draft should be a low-detail prototype:

- simple shapes for characters
- readable silhouettes
- rough panel composition
- clear movement and sequence logic
- enough concept detail to identify the characters, objects, and beats
- no full rendering
- no polished textures
- no final-style pressure

Do not use highly rendered image generation as the first blocking pass unless Taskmaster specifically asks for it.

Reason:

Highly rendered early drafts take longer, consume more resources, and create distracting false problems such as horror drift, scale drift, over-detail, and visual noise. Rough blocking makes the story movement visible faster and supports better decisions before detailed panel rendering begins.

The rough blocking format used for `Chapter 001 Page 002 - Razorforge Idea Anatomy` is the prototype for future multi-panel comic idea development.

## Visual Generation Default Rule

Default comic image generation must use the project's established plain black-and-white comic-strip / animation-style line art.

Do not use color unless Taskmaster explicitly uses the phrase:

`full color`

Do not use realistic or hyper-realistic detail unless Taskmaster explicitly uses one of these phrases:

`realistic`

`hyper-realistic detail`

Without those phrases, avoid:

- color rendering
- painterly rendering
- photorealism
- hyper-realistic texture
- cinematic lighting
- dense background detail
- realistic facial/body redesigns

All generated images must align with the source documents.

Character images must especially align with:

`C:\comics\Source\Lineup.png`

The lineup reference is the governing visual authority for Taskmaster, Razorforge, and Codex. Do not redesign recurring characters while generating images.

Before generating images involving recurring characters, check:

- `C:\comics\Source\Lineup.png`
- `C:\comics\Source\Characters\character-taskmaster.md`
- `C:\comics\Source\Characters\character-razorforge.md`
- `C:\comics\Source\Characters\character-codex.md`

If the direction has already been set, do not stop to ask process questions. Continue until a true Taskmaster decision is needed.

## Adopted Workflow Preferences

- Project folder authority
- Taskmaster final authority
- Evidence before canon
- Decision records for approvals
- Source traceability
- Fragile detail preservation
- Anti-spiral review control
- Human burden boundary
- Output usability
- Failure visibility
- Single entry / reuse everywhere, adapted for creative iteration
- Anti-redundancy, adapted to allow drafts but prevent duplicate canon
- Established premises, adapted to allow approved creative evolution
- Classification before creation
- Light waypoints instead of heavy campaign phases
- Automation boundary
- Review finality

## Light Comic Waypoints

Use these waypoints when they help the work stay clear:

1. Source intake
2. Extraction
3. Proposed adoption
4. Script or prompt draft
5. Image generation
6. Revision
7. Approval
8. Record and propagate
9. Export or next comic

Waypoints should prevent drift, not make the process feel bureaucratic.

## Not Adopted Directly

Do not directly import:

- The heavy campaign session-log pipeline
- Campaign-specific entity categories as default comic categories
- Worksheet-heavy or table-heavy user review as the main interface

These may be used as source material or adapted when useful, but they are not default comic production workflow.
