---
name: graphify-rules
description: How to use the graphify knowledge graph for cheap code search and keep it fresh. Use before exploring unfamiliar code, and after adding, deleting or renaming files.
---
# graphify rules

External prerequisite: the `graphify` skill/CLI, installed separately (not bundled). Output folder `graphify-out/` (git-ignored). See the graphify skill for install and options.

**Why:** the owner asked for it explicitly so agents reach files faster and spend fewer tokens. Reading whole folders to find one function is the most common token waste. The graph answers with file paths and line numbers in a few hundred tokens.

## Rules
1. **Query first, grep second.** `graphify query "<code names>" --budget 800` (add `--graph <path>` if not run in the repo root). For one symbol, `graphify explain "<Symbol>"` returns its file:line and who imports or calls it (about 150 tokens). Then read only those line ranges (offset/limit).
2. **Ask with code names, not sentences.** `graphify query "DocumentViewPage FinishReviewButton"` works; a plain-language question matches names loosely and returns noise.
3. For an exact string or symbol you already know, plain grep is cheaper.
4. **Refresh is mandatory:** any task that adds, deletes or renames files runs `graphify update <repo> --force` before "done" (look at `git status` for `??`, `D`, `R`). The lead also refreshes before every wave of agents. The update needs no AI model and takes minutes on a large repo.
5. Code added during a wave is not in the graph yet; agents use grep for it.
6. The graph is a map, not truth: confirm by reading the cited lines. Never read a large file end to end when a range will do.
7. Put the graph path and these rules into every agent brief (`agent-briefing`).

## How to apply
The `PostToolUse` hook of this plugin reminds you when a new file is created. If `graphify-out/` does not exist, ask the owner before building it for the first time.
