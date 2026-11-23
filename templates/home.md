# {{PROJECT_NAME}}: shared reference

One paragraph: what the product is, who uses it, how it is deployed. This folder (`docs/`) is the vault: specs, decisions, diagrams and status in one place.

## Current versions
- **Product:** `X.Y.Z` `<commit>` (YYYY-MM-DD, pushed / local only, deployed to staging / not deployed) · [[versions-log]]
- **Deployed:** `X.Y.Z` on staging (date, migrations applied); `X.Y.Z` on production (date)
- **Latest feature:** [[specs/NN-name|NN name]], version
- **Other deliverables** (own number, if any): `X.Y.Z` (source file)

## Current work (update after every step)
Newest first. Markers: ✅ done · 🔨 in progress · ⏳ waiting for owner / pending · ⛔ blocked · ⏸ parked.
- **YYYY-MM-DD ✅ NN-k = X.Y.Z `<commit>`** (pushed or not; graph updated).
  - **Done:** what was built, in one or two lines.
  - **Accepted and deferred:** known limits the owner accepted.
  - **Needs the owner's view:** screens built without a prior concept.
  - **Open:** ⏳ items still pending.
  - **Test data created:** where, and what (no secrets).
- **YYYY-MM-DD 🔨 NN-j** in progress: what runs now, who (agent/model), expected finish.
- **Still open:** reminders for the owner (settings to restore, items to publish, decisions pending).

## Design: screen by screen
The owner picks a screen; a designer agent proposes; real screenshots are approved before shipping.
- ✅ **Screen name** · version · `ux-review/<screen>/`
- 📝 **Idea name** [[specs/NN-name|NN]]: status line
- 🔨 **Feature** [[specs/NN-name|NN]]: ✅ NN-1 in X.Y.Z; ⏳ NN-2

## Sections
- **Diagrams:** [[diagrams]] · [[product-map]] · [[lifecycle]] · [[architecture-layers]] · [[database]]
- **Project:** [[deployment]] · [[accounts-and-access]] (no values) · [[roadmap]] · [[decisions]] · [[versions-log]] · [[open-and-deferred]] · [[working-rules]]
- **Specs:** [[specs/README|index]]
- **Developer guides:** [[frontend-guide]] · [[backend-guide]] · [[architecture/AGENT-RULES|agent rules]] · [[architecture/CONVENTIONS-backend]] · [[architecture/CONVENTIONS-frontend]]
- **Settings:** [[volt-kit.config]]

## Vault rules
No secrets or personal data. Sensitive notes live in `private/` (git-ignored). The home note is updated after every task.
