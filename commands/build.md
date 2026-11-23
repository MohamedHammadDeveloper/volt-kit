---
description: Build every stage of an approved spec with its tests, up to staging, without stopping
argument-hint: <spec number>
---
Build spec $ARGUMENTS end to end. Refuse if the spec status is not `approved` or `building`. The owner talks only to you; agents report to you.

## Before
1. Read the spec, its stages table and `contract.md`. Confirm nothing is undecided; if something is, ask the owner now, once, with recommendations.
2. Refresh the graph (`graphify-rules`). Check `docs/team.md` for specialists; use them (skill `team-roster`).
3. Check the process weight in `docs/volt-kit.config.md` (solo, small, large) and apply it: solo = lighter gates; small = `reviewer` before each merge; large = branches and PRs per area.

## Pipeline (do not stop between stages unless a stop condition below hits)
1. Backend stage k, then freeze its `contract.md`.
2. Frontend stage k runs **in parallel with backend stage k+1** (they have disjoint allow-lists and consume the frozen contract). Never run agents that edit the same files at the same time.
3. Each agent gets a full brief (`agent-briefing`): rules pasted, allow-list, tests and cap, stop after 3 failures, no git, model with reason.
4. After each stage: `reviewer` against spec and contract (or your own diff review for small stages), the stage's own tests, shared-file edits by you (registries, permission and route tables, translations, pinned counters), help/lesson updates for touched screens.
5. Version and changelog: bump per stage and commit per stage; when stages share files, commit once after the last of them. Commit only because this command was given by the owner for this spec; never push unless the owner has asked in this session.
6. Visible UI: produce screenshots as in `/volt-kit:screens`; for a visible change the owner's approval is required before release to staging, so collect screenshots and ask once at the end of the UI stages (not per click).
7. After all stages: run the spec's tests once (`test-cadence`), update vault, memory and graph, then deploy to staging as in `/volt-kit:ship staging` (staging needs the session approval, which running `build` for this spec counts as only if the owner said "to staging").

## Stop conditions (stop and report)
An agent fails 3 times on the same failure; the spec turns out wrong or incomplete; a 401/403 from an external service; a migration that could lose data; production anywhere; a visible change not yet approved when the pipeline reaches release.

## Report
A progress table per stage with results (numbers), what differs from the spec (named), screenshots to approve, versions produced, and your recommendation. Update the vault after every stage.
