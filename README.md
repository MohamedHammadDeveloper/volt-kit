# volt-kit

A Claude Code plugin that packages a working method: **vault-driven** notes, **spec-driven** planning, **graph-assisted** code search, and an **orchestrator** that briefs, monitors and reviews agents. Works in any project.

Arabic version: [README.ar.md](README.ar.md)

## Install

```
/plugin marketplace add MohamedHammadDeveloper/volt-kit
/plugin install volt-kit@volt-kit
```

## Prerequisites
- Claude Code and git. Hooks use POSIX `sh` (no Node needed; on Windows use Git Bash).
- graphify skill/CLI for the knowledge graph (installed separately, not bundled).
- [GitHub spec-kit](https://github.com/github/spec-kit) `specify` CLI (`uv tool install specify-cli`) for the spec commands.

## Core principle
**You talk ONLY to the orchestrator.** Every other agent is started by the orchestrator and reports back to it, never to you. The orchestrator checks `docs/team.md` before doing any non-engineering or recurring task; if no fitting specialist exists it proposes one (`/volt-kit:hire`) instead of doing the work itself.

## Quick start
1. In a new project: `/volt-kit:kickoff`. This session becomes the orchestrator and interviews you one question at a time (business, users, platforms, stack, team size, greenfield or existing code, deploy targets, languages, compliance, MVP, model budget). It writes `docs/brief.md` and `docs/volt-kit.config.md`, then, after you approve its plan, scaffolds the vault, spec-kit integration, graphify, constitution, rules tailored to your stack, project-specific agents and skills, and `docs/team.md`.
2. Later sessions: `/volt-kit:resume`.
3. Capture an idea (`/volt-kit:idea`), write a spec (`/volt-kit:spec-new`, `/volt-kit:spec-debate`), approve it, then `/volt-kit:build <spec>`.

## Commands
| Command | What it does |
|---|---|
| `kickoff` | new project: interview, brief, config, scaffold, tailored rules and team |
| `resume` | start of a later session: read vault, config, roster, memory; show pending; become the orchestrator |
| `status` | progress table (done / running / next) with time estimates |
| `idea` | capture an idea in the vault, no work started |
| `spec-new` / `spec-debate` | draft a numbered spec / debate a big one with two planners |
| `build <spec>` | run every stage of an approved spec with its tests up to staging |
| `fix` | bug: reproduce, fix, regression test, patch version |
| `screens` | real before/after screenshots for your approval |
| `ship staging` or `ship prod` | release; production only on your explicit word |
| `rule` | store a "from now on" rule with Why and How in memory and the rules |
| `decide` | record a decision (what, why, alternatives) |
| `health` | graph freshness, vault vs code, versions, roster |
| `hire` (`--update`, `--retire`) | create, change or retire a specialist agent and its skills |

## The method
- **Vault:** `docs/` holds a home note with a "Current work" section updated after every task, a versions log, one note per numbered spec with a folder for its plans and contract. No secrets, ever.
- **Spec first:** nothing is built before the owner approves; the approved spec is a contract; open questions always carry a recommendation.
- **Debate:** an architect (strong model) and a product/UX planner (default model) plan in parallel, review each other, and a merger writes the draft.
- **Graph:** ask graphify with code names first; refresh after any add/delete/rename.
- **Orchestrated agents:** explicit file allow-lists, exact tests with a cap, stop after 3 failures, no git for agents, right model per task, a contract file between backend and frontend.
- **Release and tests:** every change bumps the version and changelog; staging needs session approval, production the owner's explicit word; only the latest spec's tests before commit, the full suite once by the lead.
- **Safety:** real screenshots before visible changes; agents never read secret values.

## What is inside
| Part | Items |
|---|---|
| Skills | vault, spec-flow, spec-debate, graphify-rules, agent-briefing, release, test-cadence, visual-approval, secrets-safety, memory, cost-discipline, team-roster |
| Agents | orchestrator, planner-architect, planner-product, backend-impl, frontend-impl, vault-keeper, reviewer |
| Commands | kickoff, resume, status, idea, spec-new, spec-debate, build, fix, screens, ship, rule, decide, health, hire |
| Hooks | SessionStart reminder; PostToolUse(Write) graphify reminder on new files; Stop reminder when code changed but the vault did not (non-blocking) |
| Templates | AGENT-RULES, constitution, home, versions-log, spec, planner-brief, contract, agent, team, ideas, brief, CONVENTIONS stubs, config |

## Configuration
`docs/volt-kit.config.md` holds project name, stack, languages, model names and environments. Skills and agents are written in English; the orchestrator replies in your configured language. Agent `model:` fields default to `opus` (lead, architect), `sonnet`, `haiku`; edit the agent files to change them.

The Stop hook compares the git working tree (read-only) with the vault folder, so it reminds you when uncommitted code changes exist without vault changes.

## License
MIT
