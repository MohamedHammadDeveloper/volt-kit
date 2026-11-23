---
name: spec-flow
description: Spec-driven flow combining GitHub spec-kit with the vault. Use when starting a new feature or spec, writing or approving a spec, or turning an approved spec into stages and tasks.
---
# Spec flow (spec-kit + vault)

Prerequisite: the `specify` CLI (github/spec-kit) installed and `specify init --here` run once. Spec-kit commands are `/speckit-constitution`, `/speckit-specify`, `/speckit-plan`, `/speckit-tasks`, `/speckit-implement` (names vary by version and agent; check yours).

## Why this flow
- **Nothing is built before the owner approves.** The owner wants to understand and steer the structure; surprises cost money and trust. For architecture work in particular: research first, show options with an explanation, discuss, draft, then approve. No refactor, no "final spec" step before it is shown.
- **The approved spec is a contract.** An owner who approved a design (spec or mock-up) considers everything in it agreed. If the spec drops or changes an element, he must hear it by name before building, not discover it in screenshots.
- **Questions with recommendations** let the owner answer quickly and keep the decision with him.
- **Simple structure** (one folder per feature, no speculative layers) keeps the code readable for one developer who will maintain and hire on it.

## Where things live
Spec-kit writes `specs/NNN-feature/{spec,plan,tasks}.md` and the constitution under `.specify/memory/`. Its docs show no spec-dir setting, so keep outputs inside the vault: make `docs/specs/` the real folder and `specs` a link to it (`ln -s docs/specs specs`; Windows `mklink /J specs docs\specs`). Verify the first run lands in the vault; otherwise move the files. The vault note `docs/specs/NN-name.md` (template `templates/spec.md`) summarises and links to the spec-kit files.

## Steps
1. **Constitution:** generate once from `docs/architecture/AGENT-RULES.md` and the conventions (`templates/constitution.md`). Amend only with the owner's word and a written reason.
2. **Number** the spec (next free NN). One spec = one deliverable the owner can approve.
3. **Reuse before new:** list what already exists (tables, services, screens, registries) and what will be reused; a table or component is created only when nothing fits, scoped to the feature, with no overlap with other features.
4. **Specify:** what and why, no tech in the goal. Idea in the owner's own words, agreed design, stages table, risks, out of scope.
5. **Open questions:** each with options and a recommendation, numbered so the owner can answer "1 yes, 2 no, 3 your choice".
6. **Debate** if large (`spec-debate`), then **plan**, then **tasks**.
7. **Approval gate:** the owner approves in chat; record the date and any changes he made in the status line.
8. **Contract:** from approval on, anything dropped, deferred or changed is named explicitly. Backend and frontend share a frozen `contract.md`.
9. **Stages:** each ships alone (version, changelog, vault, migration, docs, model, test caps). Run with `/volt-kit:build`.
10. Keep about one tenth of each spec's effort for tidying the area it touches (structure debt), if the owner agreed to that policy.

## Dynamic by design
Anything the product enumerates (screens, permissions, widgets, settings, kinds, types) is defined once in a registry or catalog and the UI/API is generated from it. Adding an item is one entry, not edits in five places, plus an automated check that fails when an item is incomplete. **Why:** the owner expects new screens and options constantly and does not want a structure that ties him to a fixed list. A feature that needs its own data gets its own tables and never alters core system tables (see `templates/CONVENTIONS-backend.md`).
