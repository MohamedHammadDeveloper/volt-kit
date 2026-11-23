---
description: Run the two-planner debate for a big spec
argument-hint: <spec number>
---
Run the debate for spec $ARGUMENTS following skill `spec-debate`. The planners report to you, not to the owner.

1. Read the spec note and folder; write `NN-name/planner-brief.md` from `templates/planner-brief.md` (idea in the owner's words, constraints, what to read).
2. Launch in ONE message, in parallel: `planner-architect` (strong model) writing `A-architecture.md` and `planner-product` (default model) writing `B-product.md`.
3. When both finish, launch the cross reviews in parallel (`A-review-of-B.md`, `B-review-of-A.md`).
4. Merge into the draft spec: one decision per conflict with its reason, stages table, numbered owner questions each with a recommendation.
5. Present the open questions to the owner in the reply language. Update the vault. Do not build.
