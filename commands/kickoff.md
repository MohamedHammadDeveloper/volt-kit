---
description: First command in a new project. This session becomes the orchestrator, interviews you, then scaffolds vault, rules and a project-specific team
argument-hint: [one-line idea]
---
This session BECOMES the orchestrator (follow `agents/orchestrator.md` of the volt-kit plugin). The owner talks only to you; every other agent is started by you and reports back to you.

Idea from the owner (may be empty): $ARGUMENTS

## Phase 1: interview
Ask ONE question at a time. Use the AskUserQuestion tool when available (options with your recommendation marked); otherwise numbered options in plain text. Offer a recommended answer every time. Skip a question the owner already answered; ask a follow-up only when an answer changes the setup. Cover, in this order:
1. The business and the problem; who the users/personas are.
2. Platforms (web, mobile, desktop, API, CLI).
3. Backend stack, frontend stack, database (recommend simple, mainstream choices that the owner can maintain).
4. **Team size:** solo / small / large. It decides process weight:
   - solo: fewer agents, lighter gates, direct commits to one branch.
   - small: review (`reviewer`) before each merge, short-lived branches.
   - large: owners per area, branches and pull requests, CI, stricter contract files.
5. Greenfield or existing code. Existing code: run `graphify` first (`graphify-rules`) and read the map before asking about structure.
6. Deploy targets: local only, staging, production; names of environments.
7. UI language, reply language (how you talk to the owner), text direction (RTL/LTR).
8. Security, data and compliance constraints (personal data, regions, audit needs).
9. MVP scope: the smallest thing worth shipping, and what is explicitly later.
10. Model budget: which model is default, strong, small (the strong one only for security, migration, architecture).

Then write `docs/brief.md` (the business, users, scope, constraints, MVP, out of scope, in the owner's words where possible) and `docs/volt-kit.config.md` (from `templates/volt-kit.config.md`, filled). Show both and ask the owner to confirm or correct.

## Phase 2: scaffold (only after the owner approves a short plan you show first)
Never overwrite existing files; report what you skipped. Use the plugin's `templates/` (`${CLAUDE_PLUGIN_ROOT}/templates/`).
1. **Vault** under the vault folder: `home.md`, `versions-log.md`, `decisions.md`, `ideas.md`, `open-and-deferred.md`, `specs/README.md`, `architecture/`, `private/` (add `docs/private/` and `graphify-out/` to `.gitignore`). Copy `templates/planner-brief.md` to `specs/_planner-brief.md`.
2. **spec-kit integration:** tell the owner to run `specify init --here` (you do not run it) and how `specs` links to `docs/specs` (skill `spec-flow`). Generate the constitution from the project rules.
3. **graphify:** build the first graph if the owner agrees (needed for existing code).
4. **Rules:** `architecture/AGENT-RULES.md` with the project's product rules filled in, and `CONVENTIONS-backend.md` / `CONVENTIONS-frontend.md` **tailored to the chosen stack** (real folder names, real test and check commands, real reference examples to be created by the first feature).
5. **Project-specific team** in `.claude/agents/` and `.claude/skills/`: specialise the generic agents for the stack (for example `backend-impl` written for the chosen framework, its test command and structure; `frontend-impl` likewise), add stack skills the agents will need, and any agent the business domain obviously needs (use the `hire` flow and its template `templates/agent.md`). Scale the team to the team size from the interview.
6. **`docs/team.md`:** the roster (from `templates/team.md`): every agent, mission, model and why, skills, status.
7. **CLAUDE.md:** a short section: vault location, "read the home note's Current work first", pointers to config, rules and `docs/team.md`, "talk to the orchestrator; update the vault after every task".
8. **Memory:** create the index and the binding owner rules confirmed in the interview (skill `memory`).
9. Record the setup decisions in `docs/decisions.md`; update the home note's Current work.
10. Tell the owner the prerequisites still to install (graphify, `specify` CLI, git) and propose the first spec: `/volt-kit:spec-new`.

Never put secrets in any generated file.
