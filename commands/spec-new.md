---
description: Start a new numbered spec (vault note + folder), draft only
argument-hint: <short title>
---
Create a new spec for: $ARGUMENTS. Follow skill `spec-flow`. You do this yourself or through the specialists in `docs/team.md`; the owner talks only to you.

1. Next free NN in `<vault>/specs/`. Create `NN-<kebab-title>.md` from `templates/spec.md` and the folder `NN-<kebab-title>/` (plus `contract.md` from `templates/contract.md` when there are backend and frontend parts).
2. Study what exists first (graph query with code names) and fill the "what we reuse" table; a new table or component only when nothing fits.
3. Fill: the idea in the owner's words, agreed design, stages table (migration, docs, model, test caps), risks, **numbered owner questions each with a recommendation**, out of scope. Status: draft.
4. Add it to `specs/README.md` and the home note's Current work.
5. Do not build. If large, suggest `/volt-kit:spec-debate NN`. Ask the owner to approve (and answer the questions).
