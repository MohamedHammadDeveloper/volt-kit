---
description: Record a decision (what, why, alternatives) in the vault decisions note
argument-hint: <the decision>
---
Record this decision: $ARGUMENTS

Append to `docs/decisions.md`, newest first:
- **Date, short title.**
- **Decision:** what was decided, in the owner's words where possible.
- **Why:** the reason.
- **Alternatives considered:** each with why not.
- **Affects:** spec numbers, files or agents; link them with wikilinks.
- **Revisit when:** a condition, if any.
Ask one short question only if the reason or alternatives are missing and cannot be inferred from the conversation. If the decision changes an approved spec, mark it in that spec's "changed from the approved spec" section. Update memory if it is also a standing rule (then use `/volt-kit:rule`).
