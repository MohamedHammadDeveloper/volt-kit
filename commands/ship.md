---
description: Pre-ship checklist and deploy to staging or production
argument-hint: staging | prod
---
Ship to: $ARGUMENTS. Follow skill `release`.

1. Checklist: version bumped (feature = minor, fix = patch), version file, CHANGELOG and versions log agree; vault, help pages and lessons updated; visible changes approved on screenshots; no secrets in the diff (`git diff`, read-only); the latest spec's tests pass (full suite once, by you, only if this is the end of a wave).
2. **staging:** requires approval in this session. State the exact commit and what migrations will run; take a backup first if the environment has data; deploy that commit; verify the health endpoint and the reported version; record the result in the vault.
3. **prod:** only with the owner's explicit word for THIS release, naming the version. If the word is not in this session's chat, stop and ask. Same checks plus backup, migration review (additive, real downgrade) and a rollback plan stated before you act.
4. Commit and push only if the owner asked. Update vault, versions log (where deployed) and memory.
5. Report what was checked and the verified result, not assumptions.
