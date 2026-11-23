---
name: secrets-safety
description: Handling of secrets and credentials. Use whenever a task touches tokens, keys, passwords, .env files, database URLs, or an external service returns 401/403.
---
# Secrets safety

**Why:** an agent debugging a 401 compared copies of an API-key environment variable in a shell, used a name that was an alias for history, and the error message printed the entire key into the tool output. The owner had to rotate it. A 401 is not the agent's to diagnose; any inspection of a secret's value (compare, hash, length, partial print) can leak it into logs.

## Rules
1. Agents never print, compare, hash, measure or diff the **value** of a secret (API keys, tokens, `.env`, database URLs, key stores, user/machine environment copies). "Is it set?" is allowed; reading the value is not.
2. Secrets are read from the environment only, by the program, never by the agent.
3. **A 401 or 403 from an external service: stop and report immediately.** No other credentials, no other endpoints, no workaround.
4. The owner types passwords and approves logins; agents never enter credentials. Tokens are not taken from chat; the owner places them where the program reads them.
5. Secrets never go into the vault, specs, commits, reports, tables or chat. Document where a secret lives, not what it is. Secret files are git-ignored; commit an example file with placeholder names.
6. Tests use test credentials from seed/example files and dedicated test databases only, never real ones or production data.
7. Logs, audit entries and error `details` carry identifiers and counts, never secrets or private content.
8. If a secret is exposed, tell the owner at once so it can be rotated.

## How to apply
Put the sentence in every brief that uses a key: "read the secret from the environment only; never inspect, compare, hash or print it; on 401/403 stop and report."
