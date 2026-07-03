# Proposed Comic Workflow Principles From Campaign Project

Status: approved and promoted

Approval:

`APPROVE COMIC WORKFLOW PRINCIPLES`

Promoted to:

`C:\comics\Source\Canon\comic-workflow-governance.md`

Source reviewed:

- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\AGENTS.md`
- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Primary_Project_Directives.txt`
- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Master_Project_Standards.md.txt`
- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Master_Project_Procedures.md.txt`
- Existing comic project canon and extraction notes

Purpose:

Identify campaign-project workflow preferences that should be adopted or adapted for the comic-producing project before they are promoted into comic project governance.

## Recommended Adoption Summary

Recommended action:

Adopt the principles below as comic workflow governance after user approval.

Do not yet rewrite the comic project's `AGENTS.md` or canon files until the user approves, revises, or rejects this proposal.

## Adopt Directly

### 1. Repository / Project Folder Authority

Campaign principle:

The repository is permanent. Chats, interfaces, generated outputs, and tools are not authoritative unless promoted into repository artifacts.

Comic project adoption:

`C:\comics` is the durable project memory. Chat discussion is useful, but approved comic rules, character details, visual calibrations, scripts, prompts, and final images must be recorded in project files.

Comic impact:

- Approved character details go into `Source/Characters/`.
- Approved language goes into `Source/Language/`.
- Approved canon and production principles go into `Source/Canon/`.
- Generated images go into `Images/Generated/`.
- Scripts, prompt records, and panel logic go into `Scripts/`.

### 2. Project Owner Authority

Campaign principle:

The project owner is the final authority. Agents recommend, organize, extract, reconcile, and validate, but do not replace owner decision-making.

Comic project adoption:

Taskmaster is the final authority for canon, visual identity, tone, approval, rejection, revision, and completion.

Comic impact:

No new canon should be treated as approved merely because Razorforge or Codex generated it. It becomes approved when Taskmaster explicitly approves it or when a standing approved rule permits it.

### 3. Evidence Before Canon

Campaign principle:

Information becomes authoritative only when supported by evidence, observation, confirmation, prior authority, or explicit approval.

Comic project adoption:

Character facts, visual rules, symbolic meanings, recurring terms, and world logic should come from:

- User-provided source material
- Existing approved project files
- Approved generated outputs
- Explicit Taskmaster approval

Comic impact:

Speculative ideas may be drafted, but must stay labeled as draft, concept, proposal, or working material until approved.

### 4. Decision Record Requirement

Campaign principle:

Conversation alone does not preserve project authority. Approved decisions become durable when recorded.

Comic project adoption:

When Taskmaster approves a visual calibration, principle, generated comic, recurring symbol, or story rule, the approval should be recorded in the relevant project file.

Comic impact:

The approved Taskmaster build calibration from `comic-001-the-fragile-detail-v3.png` is a good example: approval was recorded in the script note, Taskmaster file, and canon world rules.

### 5. Source Traceability

Campaign principle:

Derived outputs should preserve enough source reference to trace decisions and uncertainties back to originating material.

Comic project adoption:

Comic scripts, generated images, and adopted principles should preserve their source basis when practical.

Comic impact:

Generated comics should keep:

- Final image path
- Script or panel logic
- Prompt or generation notes
- Source principle being illustrated
- Any relevant reference files

### 6. Fragile Detail Preservation

Campaign principle:

Useful fragile information should be preserved when it supports recall, validation, continuity, extraction, or reconstruction.

Comic project adoption:

Small uncertain details, half-formed terms, running jokes, motifs, visual oddities, and unresolved meanings should be preserved without forcing immediate canon decisions.

Comic impact:

Use `Working/` or `Source/References/` for non-blocking preserved details. Promote only when Taskmaster approves or the detail becomes structurally important.

### 7. Anti-Spiral

Campaign principle:

Review exists to support decisions. Review should not create endless review layers.

Comic project adoption:

Creative review should produce one of:

- Approve
- Direct revision
- Defer with cause
- Stop

Comic impact:

Do not keep generating review artifacts about review artifacts. If a comic image is close, revise directly. If it is approved, record approval and move on.

### 8. Human Burden Boundary

Campaign principle:

If a workflow requires the user to repeatedly copy, re-enter, reformat, or manually reconcile the same information, stop and redesign.

Comic project adoption:

Taskmaster should not have to do machine work.

Comic impact:

The assistant should organize files, record approvals, preserve prompts, and propagate accepted visual rules rather than asking Taskmaster to manually restate them.

### 9. Output Usability

Campaign principle:

Operational outputs should be directly usable, readable, and repository-ready.

Comic project adoption:

Comic project outputs should be easy to use later: clear file names, clear versioning, and clean notes that support future retrieval.

Comic impact:

Avoid dumping vague notes into chat only. Save reusable comic material to project folders in a readable structure.

### 10. Failure Visibility

Campaign principle:

Failures, missing inputs, incomplete records, uncertain state, and unresolved blockers should be visible.

Comic project adoption:

When a generated image has wrong proportions, wrong text, bad likeness, continuity drift, or unclear symbolism, record the issue or revise it directly.

Comic impact:

Do not silently treat a flawed image as approved. Keep versions until Taskmaster approves one.

## Adopt With Creative Adaptation

### 11. Single Entry / Reuse Everywhere

Campaign principle:

Information should be entered once and reused through derived outputs.

Comic project adaptation:

Approved comic facts should be stored once in the right source file, then reused in scripts and prompts.

Reason for adaptation:

Creative work often needs variants, drafts, and exploration. The rule should prevent repeated manual restatement, not prevent creative iteration.

Comic version:

Store stable facts once. Iterate freely in `Working/`, but promote only the approved version.

### 12. Anti-Redundancy

Campaign principle:

Derive before duplicate. Consolidate before expand. Reference before recreate.

Comic project adaptation:

Before creating a new canon file, symbol file, prompt style rule, or character rule, check whether an existing file should be updated instead.

Reason for adaptation:

Creative projects benefit from parallel sketches and drafts, so redundancy is not always failure. Redundant durable governance is the problem.

Comic version:

Draft variants are allowed. Duplicate canon is not.

### 13. Established Premises

Campaign principle:

Accepted conclusions become working premises and should not be repeatedly re-argued without cause.

Comic project adaptation:

Approved visual calibrations, role definitions, and symbolic meanings should become default assumptions.

Reason for adaptation:

Creative tone can evolve. Premises should remain active but not become cages.

Comic version:

Use approved premises by default. Reopen them when Taskmaster asks, when generated output reveals a problem, or when a better visual rule is approved.

### 14. Classification Before Creation

Campaign principle:

Determine whether an artifact is a rule, principle, directive, standard, procedure, template, reference material, or repository data before creating it.

Comic project adaptation:

Before saving new material, classify it as:

- Canon
- Character
- Language
- Reference
- Script
- Generated image
- Edit
- Working draft
- Export

Reason for adaptation:

The comic folder already has a lighter structure than the campaign repository. Use just enough classification to keep retrieval easy.

### 15. Phase Discipline / Waypoints

Campaign principle:

Completed phases should not restart without cause, and future-phase work should not displace current-phase work.

Comic project adaptation:

Use light waypoints rather than heavy phases.

Suggested comic waypoints:

1. Source intake
2. Extraction
3. Proposed adoption
4. Script or prompt draft
5. Image generation
6. Revision
7. Approval
8. Record and propagate
9. Export or next comic

Reason for adaptation:

Comic creation should stay playful and fluid. Waypoints should prevent drift, not make the process feel bureaucratic.

### 16. Automation Boundary

Campaign principle:

Automation may prepare, extract, compare, propose, validate, and report, but must not silently canonize or overwrite durable records without approval.

Comic project adaptation:

Codex may generate, organize, and propose. It may record obvious approved decisions after Taskmaster approves them. It should not silently replace approved canon, approved visuals, or final images.

Reason for adaptation:

This comic project is intentionally collaborative and generative. The boundary should prevent accidental authority, not prevent useful assistance.

### 17. Review Finality

Campaign principle:

A review step must produce accept, direct revision, defer with cause, or stop.

Comic project adaptation:

Comic review should use the same outcomes, but with creative language:

- Approve
- Revise
- Park
- Stop

Reason for adaptation:

"Defer with cause" is useful, but "park" better fits idea management and unresolved motifs.

## Adopt As Comic Symbolic Language

These are both workflow preferences and comic motifs:

- Archive: durable memory / approved source of truth
- One True Intake: capture once, reuse everywhere
- Review Spiral: endless recursive review without progress
- Fragile Detail Jar: preservation without canonization
- Approval Stamp Rack: different approvals have different powers
- No-Write Boundary: approval to explore is not approval to canonize
- Human-Facing Control Panel: outputs should be usable by Taskmaster
- Manual Duplication Alarm: the process is making the human repeat work
- Phase Gate Track: light waypoints that stop drift
- Source Tag: every canon object needs provenance

## Do Not Adopt Directly

### 1. Heavy Campaign-Specific Session Workflow

Do not directly adopt the full session-log pipeline:

Raw Dictation -> Structured Dictation Review -> Memory Recovery -> Recovery Questions -> Session Draft -> Reconciliation -> Repository Updates

Reason:

This is too heavy for most comic production.

Comic adaptation:

Use a lighter source pipeline:

Source Material -> Concept Extraction -> Proposed Canon/Language -> Script/Prompt -> Generated Image -> Revision -> Approval -> Record

### 2. Campaign-Specific Entity Categories

Do not directly adopt campaign categories such as NPCs, factions, locations, jobs, clues, and threads as default comic production categories.

Reason:

They may be useful as source material, but the comic needs character, symbol, language, script, image, and continuity categories.

### 3. Raw Markdown Table / Worksheet Burden

Do not use machine-facing worksheets as the main user interface unless specifically needed.

Reason:

The campaign project explicitly learned that ugly or burdensome interfaces fail the human-facing workflow test.

Comic adaptation:

Use short approval summaries, visible image previews, and clear revision requests.

## Proposed Comic Governance Text To Adopt

If approved, this wording can be inserted into `C:\comics\AGENTS.md` or a new governance file under `C:\comics\Source\Canon\`.

```markdown
## Comic Workflow Governance

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
- Failures, uncertainties, and blockers should be visible rather than silently ignored.
- Future ideas may be parked without displacing the active task.
```

## Proposed Folder Behavior

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

## Recommended Decision

Recommended approval:

Adopt the proposed comic workflow governance with light adaptation.

Why:

It preserves the user's working style without importing the full campaign-management machinery. It supports comic production by keeping source material durable, approvals visible, visual canon stable, and iteration lightweight.

## Decision Needed

Taskmaster decision requested:

Approve, revise, or reject this proposed adoption set.

Suggested response options:

`APPROVE COMIC WORKFLOW PRINCIPLES`

`REVISE COMIC WORKFLOW PRINCIPLES: [correction]`

`REJECT COMIC WORKFLOW PRINCIPLES`

What happens after approval:

The approved governance text will be added to the comic project guide and/or canon workflow files, and the adopted symbolic terms will remain available for future comic scripts and image prompts.
