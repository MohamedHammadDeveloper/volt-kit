# Rules for every agent that writes code in {{PROJECT_NAME}}

Owner's standing rules. The lead pastes this file, unchanged, into every coding agent's brief. Structure source: `docs/architecture/` (the architecture spec and the CONVENTIONS files).

## 1. Follow our structure, do not improvise
- Put code where the architecture docs say (server structure, front-end structure, checklists). Copy the **reference example** for the kind of thing you write (a feature, a list, an action): {{name the reference examples}}.
- Do not invent new folders, patterns, layers, base classes, providers, libraries or conventions. If the structure does not cover your case, stop and ask the lead.

## 1b. Find code cheaply (token budget)
- To locate code you do not know yet, ask the knowledge graph first instead of reading whole folders:
  `graphify query "<what you look for>" --budget 800` (add `--graph <path>` if needed). It answers with file paths and line numbers; then read only those lines (offset/limit).
- Ask with **code names**, not sentences: `graphify explain "<Symbol>"` (file:line, who imports or calls it, about 150 tokens) or `graphify query "<Name1> <Name2>" --budget 800`. A plain-language question returns noise.
- The lead refreshes the map before each wave; code added during your own wave is not in it yet, use grep for that.
- For an exact symbol or string you already know, grep is cheaper than the graph.
- Never read a large file end to end when a range will do.

## 2. Simple over clever (no over-engineering)
- The simplest working solution: a plain function before a class, moving or splitting code before a new layer, a plain prop or argument before a global/context.
- **Rule of three:** no shared helper, component or abstraction unless the same thing exists in 3 real places and unifying it deletes more lines than it adds.
- No speculative options, parameters, flags or extension points; add them when a real use needs them.
- A new developer should understand a whole feature in an hour.

## 3. Comments: few and short
- Readable code gets no comment.
- Comment only a *why* the code cannot show (a hidden constraint, an owner decision, a performance reason), usually one line, with the spec reference if any.
- No comments that restate the code, no long header blocks, no padding blank lines.

## 4. Do exactly the task
- Touch only the files in your allow-list. Delete nothing that is not yours.
- Run only the tests named in your task, and write no more tests than its cap. Never run the full suite.
- Write the success criterion first if the task is a measurement; never change a threshold, weight or test to make it pass. Report FAIL honestly.
- **After 3 failed attempts on the same failure, stop and report.** Do not install alternatives or try workarounds.
- Report: files changed, lines added and removed, tests run with results, open issues. "Passed with skipped" is not a pass.
- Shared files (registries, permission and route tables, translation files, shared models, pinned counters) are the lead's unless your brief lists them.

## 5. Hard limits
- **No git or GitHub.** No commit, push, stash, checkout, reset, clean, `gh`. Read-only `git status` and `git diff` only.
- **Secrets** come from the environment only. Never print, compare, hash or inspect a key, token or database URL. On a 401 or 403 from an external service, stop and report.
- Use only the dedicated test databases/folders named in your brief. Never touch production data or other apps in the repo.
- One browser at a time, closed (with its child processes) when you finish; one or two live checks at most.

## 6. Product rules
{{Fill in the rules that must never break in this product. Examples of the kind of rule:}}
- User-facing language and register: {{UI language, formal/informal}}; every UI key in all supported languages.
- Names visible to customers: no internal names (models, vendors, engines).
- Visual rules: {{for example solid surfaces, one accent colour, no gradients or glow}}.
- Not-found vs forbidden: do not leak the existence of things the caller cannot see.
- **Help and lessons follow their screen:** a front-end change to a page that has a lesson or help page updates it in the same change (steps, anchors, all languages). A screen change without it is not done.
- Version bump, CHANGELOG and the vault are the **lead's** job; agents do not edit them.
