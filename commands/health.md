---
description: Check graph freshness, vault vs code drift, version consistency and stale agents
---
Run a read-only health check and report a short table (item, finding, fix):

1. **Graph:** `graphify-out/` exists and is not older than the latest code change (`git log -1`, file times). Fix: `graphify update <repo> --force`.
2. **Vault vs code:** the home note's "Current work" and version lines match the real version file and latest commit; each spec marked `shipped` has a versions-log entry; screens changed in the last commits have updated notes/help/lessons; the vault has no secrets (grep for key-like strings by pattern only, never print values).
3. **Versions:** version file, CHANGELOG and versions log agree; every deployed environment's version is recorded.
4. **Roster:** every agent in `docs/team.md` has a file in `.claude/agents/` and vice versa; agents unused for a long time or whose skills no longer exist are flagged for `hire --retire` or `--update`.
5. **Rules:** AGENT-RULES, CONVENTIONS and the constitution exist; memory index lists no missing files.
6. **Leftovers:** uncommitted work you did not start, temporary databases or browser processes, settings the owner was asked to restore.
Do not change anything except where the fix is trivial and safe; propose the rest.
