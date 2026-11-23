---
name: release
description: Versioning, changelog and environment promotion rules. Use when finishing a change, bumping a version, or deploying.
---
# Release rules

**Why:** the owner wants every change to be visible in the version number, so anyone can tell what is running where. A single source of truth for the number and a changelog entry per change make "what shipped" answerable in seconds.

## Versioning
1. **Every change bumps the version** (SemVer): new feature = minor, fix = patch, breaking = major. Unreleased work is numbered too. If an app has several deliverables with separate release channels (for example a web app and a desktop shell), each has its own number and changelog; bump a deliverable only when something inside it changed.
2. **One source of truth** for the number (a version file or package manifest); everything else (footer, backend constant) reads it or is checked against it by a script (`check:version` style).
3. **CHANGELOG.md** in the repo root and a one-line entry in `docs/versions-log.md`: version, what changed, spec number, commit hash once committed, and where it is deployed.
4. **Version check** before "done": version file, changelog and versions log agree (`/volt-kit:ship`).

## Environments (names in `docs/volt-kit.config.md`)
| Env | Rule |
|---|---|
| dev / local | free; additive migrations may be applied without asking |
| staging | needs approval in the current session; deploy a named commit; backup first if it has data you care about |
| production | only on the owner's explicit word for that release; approval does not carry to the next release |

## Migrations
- Additive ("expand only") where possible; a real `downgrade` that refuses to run if it would lose customer data.
- Data changes (seeds, backfills) go in a migration separate from schema changes.
- Migrations never import live application code; copy what they need.
- Never edit a shipped migration; never apply migrations to the customer/production database from a dev session.

## How to apply
Run `/volt-kit:ship`. Commit and push only when the owner asks; the lead does it, never an agent. After a deploy, verify with the health endpoint and the reported version, not by assumption.
