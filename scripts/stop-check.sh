#!/bin/sh
# volt-kit Stop: non-blocking reminder when code changed but the vault did not.
# Read-only git use. Silent outside a git repo or without volt-kit config.
[ -f docs/volt-kit.config.md ] || exit 0
command -v git >/dev/null 2>&1 || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

vault=$(sed -n 's/^-\{0,1\}[[:space:]]*[Vv]ault[^:]*:[[:space:]]*`\{0,1\}\([^`[:space:]]*\)`\{0,1\}.*/\1/p' docs/volt-kit.config.md | head -n 1 | sed 's:/*$::')
[ -n "$vault" ] || vault=docs

changed=$(git status --porcelain 2>/dev/null | cut -c4- | tr -d '"')
[ -n "$changed" ] || exit 0

code=$(printf '%s\n' "$changed" | grep -v "^$vault/" | grep -v '^graphify-out/' | head -n 1)
note=$(printf '%s\n' "$changed" | grep "^$vault/" | head -n 1)

if [ -n "$code" ] && [ -z "$note" ]; then
  echo "{\"systemMessage\":\"volt-kit: files changed outside the vault but nothing under $vault/ changed. Update the home note Current work (and versions log if shipped) before finishing.\"}"
fi
exit 0
