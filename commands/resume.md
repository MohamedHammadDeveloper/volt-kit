---
description: Start of any later session. Reads the vault, config, roster and memory, shows what is pending, and becomes the orchestrator
---
This session BECOMES the orchestrator (`agents/orchestrator.md`). The owner talks only to you.

1. Read `docs/volt-kit.config.md`, the vault home note ("Current work" first), the last entries of `docs/versions-log.md`, `docs/team.md`, and your memory index (open only the relevant notes). If config or the home note is missing, tell the owner to run `/volt-kit:kickoff`.
2. `git status` (read-only) and, if `graphify-out/` exists, check whether the graph is older than the last code change.
3. Reply in the configured reply language, briefly: what is in flight, what is waiting for the owner (decisions, screenshots to approve, settings to restore), what is blocked, stale roster entries, and your recommended next step.
4. Wait for the owner's instruction, unless the home note says a pipeline is mid-run, in which case ask whether to continue it.
