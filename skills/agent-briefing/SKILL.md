---
name: agent-briefing
description: The brief every spawned agent must receive, and the rules block to paste into it. Use whenever delegating work to a subagent or worker.
---
# Agent briefing

An agent knows only what the brief says, and takes it literally. **Why:** every unbounded brief seen in practice ended in the same ways: edits outside the intended files, over-built abstractions, whole test suites run for a small change, thresholds tweaked until a check passed, and endless retries. Each item below exists because it was paid for once.

## The brief (always all of it, in this order)
1. **Goal:** one or two sentences, plus the spec and stage path it belongs to.
2. **Rules:** paste `docs/architecture/AGENT-RULES.md` verbatim (and the relevant CONVENTIONS file or the section that applies). Never paraphrase it and never skip it.
3. **File allow-list:** "these files and folders only". Everything else is read-only. Also: no deleting anything, no editing existing scripts or config that are not listed.
4. **Contract:** for backend and frontend pairs, the frozen `docs/specs/NN-name/contract.md`. Neither side edits it; they ask the lead.
5. **Success criterion written before the work**, each item PASS or FAIL. Explicitly: "do not change a threshold, weight or test to make a criterion pass; if it fails, report FAIL and why". An honest failure is worth more than a bent pass.
6. **Tests:** the exact command(s) for the touched part only, and a cap on how many tests it may write. "Never run the whole suite." A pass with skips is not a pass.
7. **Stop rule:** "Stop and report after 3 failed attempts on the same failure. Do not install alternative stacks or try workarounds."
8. **Hard limits:** no git or GitHub (read-only `git status` / `git diff` only); secrets only from the environment and never inspected (`secrets-safety`); only the dedicated test databases/folders named in the brief; do not touch the production data or the other apps in the repo.
9. **Finding code:** the graph path and the rules of `graphify-rules` (code names, then line ranges).
10. **Model and why:** state it to the owner (strong for security, migration, architecture; default for normal code; small for mechanical work).
11. **Report format:** files changed, lines added and removed, tests run with results, open issues, assumptions. Under 15 lines, numbers not adjectives.
12. **Environment hygiene:** one browser at a time, closed (and its child processes) at the end of the run; at most one or two live checks; temporary databases/folders under the agent's own name.
13. **Docs and help:** if a screen with a help page or lesson changes, the same agent updates it, or the brief says which follow-up agent does.

## Rules block to paste (the template lives in `templates/AGENT-RULES.md`)
Contents: follow the structure and copy the reference example; do not invent folders, patterns, layers, libraries; simple over clever (a function before a class, moving code before a new layer, the rule of three, no speculative options); comments few and short, only a *why*; do exactly the task and nothing else; hard limits; product rules; who owns version, changelog and vault (the lead).

## How to apply
- Parallel agents: disjoint allow-lists; shared files are edited by the lead at the end of the wave.
- A change of design (a concept the owner approved) is the visual reference: "any difference from it is reported, never decided locally".
- If an agent returns something that does not match the brief, reject and re-brief; do not patch silently.
- Review each report before the next round (`orchestrator` section 6).
