---
name: spec-debate
description: Two-planner debate for large or ambiguous specs, with cross reviews and a merged draft. Use when a spec touches architecture, data model or UX in ways where one author would miss things.
---
# Spec debate

**Why:** one author reads the code from one angle. A planner who knows the architecture misses the user flow; a product planner misses the data and security constraints. Two plans plus a cross review found real mistakes (wrong assumptions about existing code, a naming confusion in the request, a security hole in an attachment rule) before a line was built.

## When
Use for large or risky specs: new data model, permissions, scheduling, cross-feature behaviour, new screens. Skip for small fixes and one-screen changes (a single short plan from the lead is cheaper).

## Procedure (files in `docs/specs/NN-name/`)
1. Lead writes the **planner brief** (`templates/planner-brief.md`): the owner's idea in his words, constraints, what to read, what not to do, page limit.
2. In parallel, separate files:
   - **Planner A, architect** (`planner-architect`, strong model): reads the real code; reuse table with file paths, data model, boundaries, scheduling/transactions, permissions, security and leaks, migration and rollback, limits, risks. Writes `A-architecture.md`.
   - **Planner B, product/UX** (`planner-product`, default model): personas and scenarios, flows, screens and states, wording, what to cut or merge into existing screens, owner questions. Writes `B-product.md`.
   Planning only: no code changes.
3. **Cross review:** each reads the other's plan and checks disputed points against the code. `A-review-of-B.md` and `B-review-of-A.md`: where we agree, where the other is wrong or conflicts with the code, what is missing, recommended decision per conflict. One page each.
4. **Merger** (lead, or a strong-model agent) writes `docs/specs/NN-name.md` from `templates/spec.md`: one decision per conflict with its reason, a stages table, and owner questions each with a recommendation.
5. Present the open questions in the owner's language; he answers; record his answers (including changes) in the status line. Then `spec-flow` approval.

## How to apply
- The planners do not see each other's draft before finishing their own.
- Correct the request itself when it uses a word that means something else in the code (for example a name already taken by another concept); say so in the spec.
- Keep each document short. The debate finds gaps; it is not volume.
