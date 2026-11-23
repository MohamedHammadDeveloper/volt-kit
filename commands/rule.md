---
description: Store a standing rule (from now on) with Why and How to apply in memory and the rules files
argument-hint: <the rule>
---
Store this standing rule: $ARGUMENTS

1. Search memory first (skill `memory`); extend an existing note instead of duplicating.
2. Write a feedback note: the rule, **Why** (what happened or why the owner cares, dated, ask the owner for the reason if it is not obvious, one short question), **How to apply**, scope (this project only or all). Add it to the index and mark it binding.
3. Put it where agents will see it: product or coding rules go in `docs/architecture/AGENT-RULES.md` (so every brief carries it); process rules go into the matching skill in `.claude/skills/` (create `<topic>-rules` if none fits); stack-specific rules go in the CONVENTIONS file. Update `docs/decisions.md` with a dated line.
4. Confirm in one line where it was stored and what will change in agent briefs. If it conflicts with an existing rule, show both and ask which wins.
