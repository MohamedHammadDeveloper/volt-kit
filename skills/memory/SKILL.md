---
name: memory
description: How the lead keeps persistent memory of owner rules, decisions and corrections between sessions. Use at session start, when the owner states a rule or corrects you, and at the end of every task.
---
# Memory

Memory is the lead's own notebook of how the owner wants to work. It is separate from the vault: the vault documents the product; memory records the owner's rules, preferences and corrections. Use Claude Code's auto-memory folder for the project if available, otherwise `docs/private/memory/`.

**Why:** the owner repeats a rule once. If it is not written down, the next session breaks it and the owner pays twice. Rules with their reason can be applied to new situations; bare rules get applied wrongly or dropped.

## Structure
- `MEMORY.md`: an index only, one line per note: `- [Title](file.md): one-line hook`. Keep it short (it is loaded every session). Group: owner rules (binding), project state, side topics.
- **One fact or rule per file.** Frontmatter: `name`, `description` (the line used to decide relevance), `type: feedback | project | reference`.
- Body of a **feedback** note: the rule, then **Why:** (what happened or why the owner cares, with the date) and **How to apply:** (when it triggers and what to do). Link related notes with `[[name]]`.
- Project facts that change (current version, what is deployed) live in the vault, not in memory, or the memory goes stale.

## Rules
1. **Update, do not duplicate.** Before writing, search the index; extend the existing note or fix it.
2. **Record corrections at once.** When the owner says "no, not like that", write what you did, why it was wrong, and the rule, in the same turn.
3. **Mark binding rules** in the index so they are read first; mark scope (this product only, not the side projects).
4. Record decisions with dates and the owner's own words when short; they settle later disagreements.
5. Remove or rewrite notes that became false; an outdated memory is worse than none.
6. Never store secrets, tokens or personal data in memory.
7. At session start read the index and open only the notes relevant to the task. At the end of a task, add what you learned.

## Example feedback note
```
---
name: visuals-before-shipping
description: No visible UI change ships before the owner sees real screenshots and approves
type: feedback
---
Rule: ...
**Why:** (date) shipped a redesign on concept approval alone; reverted.
**How to apply:** screenshot before/after, send, wait, then commit.
```
