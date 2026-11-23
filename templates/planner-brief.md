# Planner brief: spec NN {{title}}

Paste to each planner. Planning only: **no code changes**. Write only the file named below, in `docs/specs/NN-name/`.

## You are
Planner A (architect, strong model) / Planner B (product and UX, default model). Delete one.

## The owner's request (his words)
> ...

## Constraints
- Binding references: `docs/architecture/AGENT-RULES.md`, `CONVENTIONS-backend.md`, `CONVENTIONS-frontend.md`.
- Reuse before new: study the existing registries, tables, services and screens; a new table only if nothing fits, scoped to this feature, no overlap with other features.
- Fewer screens: related things become tabs of one screen.
- Dynamic by design: lists are registry entries, not hard-coded.
- Product rules: {{language register, no internal names, visual rules}}.

## What to read first
- Spec(s) it relates to: ...
- Code areas (use `graphify query` with code names): ...

## What to deliver (max 2 pages, headings in this order)
**A (architect):** 0 idea in two lines · 1 what exists and will be reused (table with file paths) · 2 data model · 3 boundaries and flow · 4 scheduling, transactions, concurrency · 5 permissions and visibility · 6 leaks and abuse · 7 migration and rollback · 8 limits · 9 risks · 10 owner questions with recommendations.
**B (product):** 0 idea in two lines and corrections to the request · 1 personas and scenarios (table) · 2 flows · 3 screens and states (empty, loading, error) · 4 wording in the UI language · 5 what to cut or merge into existing screens · 6 owner questions with recommendations.

## Rules
- Do not read the other planner's file until yours is written.
- Cite file paths for every claim about existing code; say "not verified" otherwise.
- Never read secret values. No git. Stop and report after 3 failed attempts on the same failure.

## Cross-review round (later)
Read the other plan; check disputed points in the code; write `<A|B>-review-of-<B|A>.md`: where we agree, where the other is wrong or conflicts with the code, what is missing, recommended decision per conflict. One page.
