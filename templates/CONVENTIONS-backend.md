# Backend conventions ({{PROJECT_NAME}})

Stub with the section headings that worked well. Fill each section with the project's real rule, one reference example (file path) and, honestly, the known violations ("allow-list that must shrink, never grow"). Keep each section short. Agents copy the reference examples; the checklist at the end is what they tick before saying "done".

## 0. Which style is the standard
When the code has two styles (old and new), say which one new code follows and where the reference examples are.

## B1. Layers and import direction
Thin route/controller (guard + validation + one service call) -> service owns the database -> pure domain package. Routes import services; services and domain packages never import the routes layer; pure packages import no framework or ORM. Rule: do not add to the list of existing violations.

## B2. Who commits the transaction
The service function the route calls is the unit of work: write, audit, notify, then commit once at the end. Thin routes do not commit. Helpers called from inside a service only add/flush. Only exception: record a denial before raising.

## B3. Where a query may live
Queries live in services or query-builder packages, never in route handlers. A table owned by one feature is queried only from that feature.

## B4. Visibility gates
Every read of protected content goes through one gate; lists apply visibility in SQL; the forbidden is "not found", never "forbidden", and counts/names/ids never leak.

## B5. Authorisation guard and adding an action
Every new route carries exactly one named action guard; unknown keys fail at import time. Denials are audited. A new action touches N named places: {{registry entry, labels in every language, registry version bump, route classification table}}. Prefer an existing action.

## B6. Error codes and body shape
The server sends a code; the client translates. Body is always `{code, message, details}`. No raw HTTP exceptions for expected errors. `details` never carries content, hidden ids or secrets. Optimistic concurrency uses a row version and a conflict code. Adding a code: table entry, factory, localisation table, client key.

## B7. Request, response and pagination models
Typed request/response models; a standard page shape with real totals; field names on the wire follow one case convention.

## B8. Registries ("dynamic by design")
Anything the product enumerates is a registry entry with a stable id; adding one is one entry plus an automated completeness check.

## B9. Audit events
`area.verb` names; identifiers and counts only; never titles, notes or secrets.

## B10. Migrations
Next-numbered file, `down_revision` = current head, a header explaining the idea and the rollback. Additive where possible; a real `downgrade`, guarded when it would lose customer data. No imports from application code (copy what you need). Data changes in a separate migration from schema changes. Update the models in the same change. A feature that needs data gets its own tables; never alter core system tables for one feature, and do not create tables needlessly: study what exists, reuse, then add the minimum scoped to the feature.

## B11. Settings and environment variables
One place reads the environment; secrets only from there; every variable documented in an example file with placeholders.

## B12. Background work
New loops register with the supervisor (name, interval, cycle, timeout); they do not start their own tasks. A cycle opens its own session and commits itself, swallows and logs failures with rate limiting, and re-raises cancellation. Queues shared by workers use row locking with skip-locked, a lease and an attempt count. State what is assumed about the number of workers.

## B13. Tests
One file per feature (`test_<feature>.py`, plus schema and no-leak files). Real database, dedicated test database names enforced by a guard. Run your file only. A new route adds: happy path (check the response, the database and the audit), a negative case (forbidden role, invisible id), route classification, action labels, a leak test if it touches restricted content, and updated pinned counters after understanding why they moved.

## B14. Naming and comments
Identifiers in English (`snake_case`, `PascalCase`, `UPPER_CASE`), full type hints. Comments explain *why* and cite the spec; a file header listing the module's functions and decisions is the strongest pattern. A lint suppression needs a reason. No stray TODO.

## B15. Product rules that never break
{{Copy the product rules from AGENT-RULES section 6 and add the server-side ones (no internal names in messages, language register, not-found vs forbidden, secrets never printed).}}

## Checklist: before you say "backend change done"
- Structure: route is thin; logic in a service or pure package; no new upward import.
- Transactions: one commit in the entry service; helpers do not commit.
- Security: reads through the gate; actions guarded and registered; leak test for restricted content.
- Contract: error codes registered and localised; response shapes match `contract.md`.
- Data: migration with real downgrade; models updated; own tables only.
- Tests: the feature's file only, within the cap; counts and classifications updated.
- Product rules: language, names, secrets.
- Lead tasks (not yours): version, changelog, vault, graph refresh.
