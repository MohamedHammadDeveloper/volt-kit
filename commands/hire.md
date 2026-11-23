---
description: Create, update or retire a specialist agent (and the skills it needs)
argument-hint: <what the agent does> | --update <name> | --retire <name>
---
Request: $ARGUMENTS. Follow skill `team-roster`. Agents are started and used only by you; they report to you, never to the owner.

## Create (default)
1. Check `docs/team.md` first: if a specialist already fits, say so and use or update it instead.
2. **Draft** from `templates/agent.md` and show it to the owner (not a file yet):
   - name (kebab-case) and mission in one sentence;
   - when to use it (the description line, written so delegation triggers correctly), and that it reports to the orchestrator;
   - **model** with a one-line reason (strong only for security, migration, architecture; default for specified work; small for mechanical);
   - **tools** (least needed; read-only agents get no Write/Edit/Bash write);
   - **file allow-list** (where it may write) and output location in the vault;
   - **skills it needs**: each as a draft `SKILL.md` too (stack how-tos, source lists, checklists, templates);
   - report format (under 15 lines, numbers not adjectives) and the stop rule (after 3 failed attempts on the same failure).
3. On the owner's approval write `.claude/agents/<name>.md` and `.claude/skills/<name>-<topic>/SKILL.md` for each skill, add a row to `docs/team.md` (mission, model and why, skills, output location, created date), and record the reason in `docs/decisions.md`. Then use the agent for the pending task.
4. Never create an agent without approval. Never give a new agent git, secrets or broader file access than the mission needs.

## `--update <name>`
Show the current definition, the proposed change and why; on approval edit the files, update the roster row and the decisions note.

## `--retire <name>`
Confirm with the owner; move the agent file to `.claude/agents/_retired/` (kept for history, not loaded as an agent), mark it retired in `docs/team.md` with the reason, and keep or remove its skills as the owner decides.
