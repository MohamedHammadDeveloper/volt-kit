# Frontend conventions ({{PROJECT_NAME}})

Stub with the section headings that worked well. Fill each section with the project's rule, one reference example (file path) and the known violations (a list that must shrink, never grow). Agents copy the reference examples and tick the checklist at the end.

## 0. Which style is the standard
When the code has an old and a new style, say which one new code follows and point to the examples.

## F1. Where a file goes
A table: folder -> what goes in -> what does not.
| Folder | Holds | Does not hold |
|---|---|---|
| pages/ | route file, page state, composition only | feature logic, detailed rendering |
| components/<feature>/ | everything a feature builds: components, hooks, pure logic, unit checks | a routed page |
| components/ui/ | shared visual components that know no feature | a component that knows a project or document |
| services/ | server calls only: one file per feature + the HTTP client | rendering, UI state |
| lib/ | pure helpers that know no feature | hooks that depend on feature context |
| types/ | shared domain types | response types of a new feature (declare them in its service file) |
Pure logic goes in a plain `.ts` file next to its component, with a `*.check.ts`.

## F2. Feature folders and their `index.ts`
Other features import only through the folder's `index.ts`; no reverse imports (components -> pages).

## F3. Registries ("dynamic by design")
Anything the product enumerates (nav items, panel groups, toolbar tools, widgets, setting kinds) is a registry entry with a stable `id`, `order`, a translation key (never text), an icon and a visibility condition. A registry that mirrors the server is a catalog plus an id snapshot that stops ids being deleted or reused. Each new registry ships with an automated check (fails for an incomplete entry) and a `--selftest`.

## F4. Data access
Server calls only in `services/`; components never import the HTTP client or write a path. A service file converts wire case to the UI case, declares its types, lists its routes/actions/errors in its header, and **reads tolerantly** (a missing field does not crash). Errors: translate by code, never show raw server text. Every fetching effect guards against a late response (ticket or cancel flag). Every polling loop stops when the tab is hidden. New functions go in their feature's file, not in a catch-all.

## F5. Permissions in the client
The server is always the judge; hiding a button is shaping, not security. Use the action-based check with named constants (a typo fails the type check). Per-item abilities come from the server response. An item the user may not use is not rendered at all (not disabled).

## F6. Translation (i18n)
No literal user text. Keys in every language, plural forms included; a check fails on a missing language or a literal string. Register of the UI language: {{formal/informal}}.

## F7. Theme, design tokens and styling
Colours, radii and spacing come from tokens, never literals. Product look rules: {{for example solid surfaces, one accent, no gradients, glow or coloured frames}}.

## F8. Text direction and accessibility
{{RTL/LTR rules: logical properties, mirrored icons, bidi isolation of numbers and Latin runs; keyboard operation; contrast; focus.}}

## F9. Keyboard shortcuts
One registry; no conflicts.

## F10. Window or shell constraints
{{Rules specific to the shell (tabs, panes, hidden-tab behaviour).}}

## F11. Local storage
Keys are namespaced and versioned; never store secrets or content.

## F12. Checks to run
| Command | Checks |
|---|---|
| `typecheck` | all types; run it first after any edit |
| `check:i18n` | literals and missing languages |
| `check:<registry>` | each registry against its definition |
| `check:units` | discovers and runs every `*.check.ts` |
| `verify` | everything above; **the lead runs it once before committing** |
Run only the check matching what you touched; no full build for a small change.

## F13. Product rules that never break
{{Copy from AGENT-RULES section 6; add the approved design concept as the visual contract: an element removed from it is reported by name before building.}}

## Checklist: before you say "frontend change done"
- Place: file in the right folder; page = composition, logic in a pure file with a check.
- Imports: features through `index.ts`; no reverse import.
- Registries: a new list = an entry + its check + selftest.
- Data: calls in `services/<feature>.ts`, tolerant reads, errors translated by code, late responses guarded, polling stops when hidden.
- Permissions: action constants; not rendered when not allowed.
- Language and look: no literal text; every language; tokens only; direction and contrast verified.
- Lessons/help of a touched page updated in the same change.
- Screenshots before/after for the lead; the owner approves before shipping.
- Checks: the matching ones pass.
