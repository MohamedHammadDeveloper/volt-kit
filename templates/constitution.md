# {{PROJECT_NAME}} Constitution

Generated from `docs/architecture/AGENT-RULES.md` and the conventions. Amend only with the owner's explicit word and a written reason.

## Principles
1. **Spec first.** Nothing is built before the owner approves the spec; the approved spec is a contract and anything dropped is named explicitly.
2. **Simple.** The simplest working solution; follow the documented structure; no invented layers.
3. **Test the touched part.** Agents test what they changed; the lead runs the full suite once, at the end.
4. **Measure before claiming.** Define the success criterion before running.
5. **Safe by default.** No secrets in code, docs or logs; external 401/403 means stop and report.
6. **Visible changes need approval** on real screenshots.
7. **Docs travel with code.** The vault and help pages change in the same change; every change bumps the version and the changelog.
8. **Environments.** Staging needs session approval; production needs the owner's explicit word per release.
9. **Agents do not touch git.** Only the lead commits or pushes, when the owner asks.

## Project-specific articles
{{Add the rules specific to this project: stack constraints, data rules, compliance.}}
