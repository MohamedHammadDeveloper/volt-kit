---
name: team-roster
description: Smart delegation and the agent roster. Use before doing any task yourself, whenever a task is outside core engineering or recurs, and when creating, updating or retiring a specialist agent.
---
# Team roster and smart delegation

The owner talks only to the orchestrator. Every other agent is started by the orchestrator and reports back to it. The roster `docs/team.md` lists who exists; project-level agents live in `.claude/agents/*.md` and their skills in `.claude/skills/<name>/SKILL.md`.

**Why:** a lead that does marketing, research or legal drafting itself burns strong-model tokens on work a cheaper specialist does better, has no memory of how that work should be done next time, and leaves no reusable asset. A specialist with its own skills makes the second run cheaper and more consistent.

## Before doing any task yourself, classify it
1. **Domain:** engineering core (code, tests, migrations, vault upkeep) or something else (marketing, research, legal text, design, data analysis, content, sales, support, finance...)?
2. **Recurrence:** will this kind of task come again?
3. If it is **outside engineering core, or recurring**, you MUST read `docs/team.md`:
   - A fitting specialist exists: brief it (`agent-briefing`) and use it. If its definition is stale or too narrow, propose `hire --update`.
   - None fits: do **not** do the task yourself. Propose a new specialist through the `hire` flow: show the draft agent and its skills, wait for approval, then create, register and use it. Next time, reuse it.
4. Engineering core tasks go to the standard implementers (`backend-impl`, `frontend-impl`, `reviewer`, `vault-keeper`) or their project-specialised versions. A trivial one-liner you may do yourself.

## The draft of a specialist (template `templates/agent.md`)
Name; mission in one sentence; when to use it (the `description`, written for delegation); model with a reason; tools (least needed; read-only roles get no write tools); file allow-list and output location in the vault; skills it needs (each a real `SKILL.md`: stack how-tos, source lists, checklists, templates); report format; stop-after-3 rule; "reports to the orchestrator only". No git, no secrets, no broader access than the mission needs.

## Recording
- Add or update a row in `docs/team.md` (template `templates/team.md`): agent, mission, model and why, skills, output location, created/updated date, status (active / retired).
- Record **why** the agent was created in `docs/decisions.md`.
- Retiring an agent moves its file to `.claude/agents/_retired/` and marks the roster row; it does not delete history.

## How to apply
- Creating, changing and retiring agents needs the owner's approval; using an approved one does not.
- `/volt-kit:health` flags roster rows without files, files without rows, and long-unused agents.
- Brief specialists like any other agent: goal, rules, allow-list, success criterion, stop rule, model and report format.
