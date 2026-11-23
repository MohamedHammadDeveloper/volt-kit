#!/bin/sh
# volt-kit SessionStart: stdout is added to the session context. POSIX sh, no dependencies.
if [ -f docs/volt-kit.config.md ]; then
  echo "volt-kit: read docs/volt-kit.config.md and the 'Current work' section of the vault home note before starting. Update the vault after every task."
else
  echo "volt-kit: no docs/volt-kit.config.md in this project. Run /volt-kit:kickoff to set up the vault and config (ignore if this project does not use volt-kit)."
fi
exit 0
