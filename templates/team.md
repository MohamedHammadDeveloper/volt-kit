# Team roster

Maintained by the orchestrator. The owner talks only to the orchestrator; every agent below is started by it and reports to it. Agent files: `.claude/agents/<name>.md`; skills: `.claude/skills/<name>/SKILL.md`. Changes need the owner's approval (`/volt-kit:hire`).

## Active
| Agent | Mission | Model and why | Skills | Writes to | Created | Notes |
|---|---|---|---|---|---|---|
| orchestrator | the lead: plans, briefs, monitors, reviews, keeps vault and memory | strong: trade-offs and coordination | all volt-kit skills | vault, shared files | kickoff | the only agent the owner talks to |
| backend-impl | backend part of a stage | default: well-specified code | {{stack skill}} | backend allow-list | kickoff | |
| frontend-impl | frontend part of a stage | default: well-specified code | {{stack skill}} | frontend allow-list | kickoff | |
| reviewer | read-only review against spec and contract | default | none | none | kickoff | |
| vault-keeper | mechanical vault upkeep | small: mechanical | vault | vault | kickoff | |

## Retired
| Agent | Retired | Reason |
|---|---|---|

## Hiring log
| Date | Agent | Why it was created (see decisions note) |
|---|---|---|
