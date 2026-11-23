#!/bin/sh
# volt-kit PostToolUse(Write): if the Write created a new file, remind about graphify.
# The hook payload arrives on stdin as JSON; a plain text match avoids needing jq or node.
input=$(cat)
case "$input" in
  *'"type":"create"'*|*'"type": "create"'*)
    echo '{"systemMessage":"volt-kit: a new file was created. Run graphify update <repo> --force before declaring the task done."}'
    ;;
esac
exit 0
