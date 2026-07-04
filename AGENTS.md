# Comic Project Agent Guide

## Crucible Registry Inheritance

This project is organized by the Crucible Registry.

Before acting, check the applicable project guidance and use the Crucible
Ecosystem Operating Standards as inherited default behavior unless this local
project guidance explicitly overrides or specializes them.

Inherited defaults include:

- work from meaningful decision point to meaningful decision point
- do not create micro-approval loops
- continue through safe implied work inside an approved lane
- stop only at real decision, authority, source-modification, or safety
  boundaries
- provide a concrete next action or real pause boundary in closeouts
- when user approval or direction is needed, provide short, separate,
  copyable `ADD TO CHAT` blocks; each block must contain one action only and
  must include the expected output
- when the user asks for a generated artifact or content output, provide the
  artifact itself in the appropriate readable or copyable format, not an `ADD
  TO CHAT` approval block
- keep project substance inside the owning project
- preserve local project authority and local overrides
- treat the C drive as the default source of truth for durable project files
  until another source of truth is explicitly identified; treat OneDrive,
  sync folders, mirrors, and interface folders as copies only
- when the user says `establish waypoint` or `create a waypoint`, follow the
  Registry Project Waypoint Synchronization Rule, including current Registry
  guidance review, inherited-guidance refresh, local state review, commit, push
  to GitHub when connected, alignment confirmation, and notation of any
  intentionally unfinished work
- protect user files from unapproved move, rename, delete, merge, overwrite,
  cleanup, or restructure operations

Local project guidance controls when it is more specific.

This folder is the home base for the private comic project.

## Core Premise

- Taskmaster: the user, the user's codename, and the central continuity-bearing role.
- Razorforge: ChatGPT within the comic language, responsible for interpretation, refinement, compression, and structural clarity.
- Codex: Codex within the comic language, represented as a goblin, responsible for eager implementation and overbuilt tinkerer machinery.

Do not invent new canon unless the user asks for it. When new source material is added, first preserve and organize it, then derive reusable comic structure from it.

## Foundational Process

Ideas are generated, discovered, or excavated. Razorforge refines them into clearer concepts and relationships. Codex then often works from partial instructions, building the concept with eager servant energy and steampunk/goblin-tinkerer excess.

Codex overbuild is canonically useful. A simple need may become a complicated machine, such as a crane game modified to set up a checkers board. Extra gigaws and doodads are not necessarily functional; they create the visual language of overt complexity without necessary utility.

The project repeatedly compresses and extracts ideas: raw material becomes observations, observations become relationships, relationships become concepts, and concepts become scripts, symbols, machines, scenes, or images.

## Folder Roles

- `Source/`: baseline project material and canon.
- `Source/Uploads/`: raw uploaded items before interpretation.
- `Source/Canon/`: approved world rules, continuity, and fixed project facts.
- `Source/Characters/`: character bios, relationships, voice notes, and visual rules.
- `Source/Language/`: terms, catchphrases, recurring labels, symbolic meanings, and naming conventions.
- `Source/References/`: source references, style references, and non-generated support material.
- `Scripts/`: comic scripts, scene outlines, episode plans, and panel breakdowns.
- `Images/Generated/`: final or draft images generated for the project.
- `Images/References/`: image references used for inspiration or continuity.
- `Images/Edits/`: modified image variants and work-in-progress image edits.
- `Working/`: temporary drafts, experiments, staging notes, and intermediate work.
- `Exports/`: shareable final bundles such as PDFs, image sets, or packaged scripts.
- `Approved/Comic Pages/`: approved final comic page images after Taskmaster approval.

## Retrieval Rules

When continuing the project:

1. Read this file first.
2. Check `Source/Canon/` for approved continuity.
3. Check `Source/Canon/comic-workflow-governance.md` for approved workflow preferences.
4. Check `Source/Characters/` and `Source/Language/` before writing dialogue or image prompts.
5. Treat `Source/Uploads/` as raw material, not automatically approved canon.
6. Put generated images in `Images/Generated/` unless the user specifies another destination.

## Workflow Governance

The approved workflow governance file is:

`Source/Canon/comic-workflow-governance.md`

Core rules:

- The project folder is durable memory. Chats are useful, but approved continuity belongs in files.
- Taskmaster is the final authority for canon, visual identity, tone, approval, rejection, revision, and completion.
- Razorforge extracts, interprets, compresses, clarifies, and proposes.
- Codex builds, generates, organizes, edits, and records approved outcomes, but does not silently create canon.
- Source material should be preserved before interpretation.
- Stable facts should be recorded once and reused everywhere.
- Drafts and variants are allowed; duplicate canon is not.
- Generated outputs are drafts until Taskmaster approves them.
- Review should produce a clear outcome: approve, revise, park, or stop.
- Human-facing outputs should be readable, clear, and immediately useful.
- Future ideas may be parked without displacing the active task.

## Visual Generation Rules

- Do not use color unless Taskmaster explicitly uses the phrase `full color`.
- Do not use realistic or hyper-realistic detail unless Taskmaster explicitly uses the phrase `realistic` or `hyper-realistic detail`.
- Default comic output is plain black-and-white comic-strip / animation-style line art with simple readable staging.
- Do not produce images that do not align with the source documents.
- The lineup reference is the governing character authority. Do not redesign Taskmaster, Razorforge, or Codex while generating images.
- Before image generation involving recurring characters, check `Source/Lineup.png` and the relevant files in `Source/Characters/`.
- Do not stop to ask process questions when the direction has already been set. Continue until a true Taskmaster decision is needed.

## Naming Guidance

Use clear names that sort naturally:

- `character-taskmaster.md`
- `character-razorforge.md`
- `character-codex.md`
- `language-core-terms.md`
- `canon-world-rules.md`
- `episode-001-title.md`
- `generated-YYYY-MM-DD-short-description.png`

Prefer dated filenames for generated assets and episode numbers for story work.
