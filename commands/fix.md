---
description: Bug report to reproduce, fix, regression test and patch version
argument-hint: <bug description>
---
Fix: $ARGUMENTS

1. **Reproduce first.** Find the code with the graph (code names), reproduce with the smallest case, and write down the observed vs expected behaviour. If you cannot reproduce, ask the owner for the missing detail, once.
2. **Cause**, not symptom: say where and why in two lines. If the fix would change an approved spec or a contract, stop and ask.
3. **Fix** through the right specialist (backend-impl / frontend-impl or one in `docs/team.md`) with a full brief and a tight allow-list; for a one-line fix do it yourself.
4. **Regression test** that fails before and passes after; run only the touched tests.
5. A visible change needs screenshots approved by the owner (`/volt-kit:screens`).
6. Patch version bump, CHANGELOG and versions-log entry, vault update, graph refresh if files changed.
7. Report: cause, fix, test result with numbers, version. Commit or deploy only as the owner asked.
