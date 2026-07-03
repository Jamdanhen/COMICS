# Behavior Discussion Export Update Protocol

Status: approved workflow instruction

Source:

- Taskmaster instruction, 2026-06-11: before running behavior extract or behavior profile, check the campaign progress folder because it records interactions related to the design of the extraction project.
- Taskmaster clarification, 2026-06-11: this applies specifically to creating the export update file for the chat used as behavior discussion.
- Taskmaster clarification, 2026-06-11: before generating a behavior log from this project, sweep the campaign development file for updates because it is the timeline and behavior-profile source feeding the comic timeline and the behavior discussion chat.
- Failure context: this rule helps prevent missed context after bandwidth or continuity failures.

## Trigger Phrases

Use this protocol when Taskmaster asks to:

- run behavior extract
- run behavior profile
- run behavior log
- generate behavior log
- behavior log extraction
- update behavior profile
- extract behavior observations
- produce behavior protocols
- create a behavior discussion export update file
- create the export update file for the behavior discussion chat
- prepare a chat export/update package for behavior discussion

## Required Pre-Check

Before creating the behavior discussion export update file, check the campaign project progress records.

If Taskmaster asks directly for a behavior extract/profile and an export update file is needed first, perform this pre-check before creating that file.

Before generating any behavior log from this comic project, sweep the campaign development file for updates. Do this even if the current chat seems to contain enough context.

Primary source folder:

`C:\CAMPAIGN_PROJECT_DEVELOPMENT`

Primary progress spine:

`C:\CAMPAIGN_PROJECT_DEVELOPMENT\Project_Architect`

Check these first when available:

- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Project_Architect\03_CURRENT_STATE.md`
- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Project_Architect\04_DECISION_LOG.md`
- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Project_Architect\06_NEXT_ACTIONS.md`
- Recent numbered phase, review, implementation, report, source-sweep, and design-note files in `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Project_Architect`

Sweep requirement:

- Check the current state, decision log, next actions, and recent Project_Architect updates.
- Look for updates that affect the extraction-project design, behavior-profile interpretation, comic timeline, or behavior discussion chat.
- Record any relevant campaign-development updates in the behavior log/export update context before generating the behavior log.
- If the sweep cannot be completed because of access, bandwidth, interruption, or missing files, state that visibly instead of proceeding as though the sweep happened.

Relevant known source:

- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Project_Architect\35_USER_PROFILE_SOURCE_SWEEP_AND_EXTRACTION_REPORT.md`
- `C:\CAMPAIGN_PROJECT_DEVELOPMENT\Project_Architect\external_source_extracts\user_profile_sources_2026-06-09`

If a literal folder or file named `Campaign Progress`, `campaign progress`, or similar is later added, check that as part of this required pre-check.

## Reason

The campaign progress records include interactions and decisions related to the design of the extraction project. The behavior discussion chat export/update file should carry that design context instead of relying only on the current chat.

The campaign development project is also the chronological spine for how the extraction system evolved. That timeline feeds the comic timeline and the separate chat that reviews and discusses behavior with Taskmaster.

## Export Update File Rule

The behavior discussion export update file should tell the behavior discussion chat what source context matters for behavior-profile work.

It should include:

- that campaign progress records must be checked before behavior extraction/profile work
- that campaign development updates must be swept before behavior log generation from this project
- which campaign project source folder and progress-spine files to inspect
- why those records matter: they preserve interactions about designing the extraction project and provide the timeline that feeds the comic and behavior discussion work
- any current-session behavior observations that should be added to the behavior discussion chat
- clear boundaries between behavior discussion, comic production, and campaign canon

It should not:

- run the behavior profile itself unless Taskmaster explicitly asks
- merge comic canon with campaign project authority
- reconstruct the whole campaign project history
- promote campaign material into comic canon

## Output Rule

When producing the export update file, behavior-focused logs, behavior extraction outputs, or session-scoped behavior observations, place the full output in a code block so it can be copied or moved as a single unit.

## Boundary

This protocol does not automatically promote campaign material into comic canon. It is a retrieval and context rule for creating the behavior discussion export update file and for later behavior extraction/profile work.
