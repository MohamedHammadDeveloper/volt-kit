---
name: cost-discipline
description: Keeping token and machine cost proportional to the task. Use when choosing models, deciding how many agents to run in parallel, planning test runs, or writing status replies.
---
# Cost discipline

**Why:** the owner noticed two days of work used a quarter of the weekly usage limit and asked whether the tasks deserved it. The causes: many parallel agents (several on the strongest model), a separate planning document by a strong model for every phase, long database suites run three times in parallel, long step-by-step browser sessions, and a paragraph of chatter after every agent notification. Another time sixteen gigabytes of memory vanished because parallel agents left headless browsers running and all ran the type checker together; the host app crashed repeatedly.

## Rules
1. **Cheapest model that suffices.** Default model normally; the strong model only for a real security boundary, a migration, or architecture trade-offs; the small model for mechanical work. Never the strong model for a fully described task or for pure UI.
2. **No separate planning agent for a phase** unless the spec is big enough to deserve a debate (`spec-debate`). Otherwise the lead writes a one-page plan or goes straight from the spec.
3. **Parallelism is allowed when file allow-lists are disjoint** (the owner permits more than two). Practical cap: 4 or 5 UI agents at once, fewer if each runs a type checker or a browser (the checker alone can take gigabytes). The rest wait their turn. Shared files are edited by the lead at the end of the wave.
4. **Tests once** (`test-cadence`): the spec's own tests before commit, no repeated or parallel full runs.
5. **Browser checks are a short smoke** of the main path, not every scenario. **One browser at a time, closed with its child processes at the end of the run;** do not touch the owner's own browser profile. After each agent finishes, check for orphaned browser processes started with a scratch profile and close those.
6. Temporary databases and folders created by an agent are removed by that agent.
7. **Short replies.** Lead with the result; no paragraph per agent notification; tables for progress; the detail is in the vault.
8. **Before starting a big spec, ask the owner how much effort it deserves,** and give a time and cost estimate that you update when it changes.
9. Prefer the knowledge graph to reading folders (`graphify-rules`); read ranges, not whole files.
10. If usage looks high, say so and propose what to cut, rather than continuing silently.

## How to apply
The orchestrator states the model choice and the reason for each agent. Review the plan against this list before launching a wave.
