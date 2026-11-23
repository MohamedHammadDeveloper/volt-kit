---
description: Produce real before/after screenshots of changed screens for owner approval
argument-hint: [screens or spec number]
---
Produce screenshots for: $ARGUMENTS (default: every screen changed since the last release, from `git diff --stat`, read-only). Follow skill `visual-approval`.

1. Start the app locally (or use the running one) and use ONE browser, closed with its child processes when done.
2. For each changed screen capture **before and after** side by side (light/dark and narrow width where the app supports them), the main state plus empty/error states that changed. Send items one by one if there are many.
3. Anything removed or moved is shown explicitly. List differences from the approved concept or spec by name.
4. Save under `docs/ux-review/<screen>/` and present them to the owner with a short list of what changed. Ask for approval or corrections.
5. Do not commit or release a visible change before the answer. Record the approval (date, screens) in the spec note and `docs/decisions.md`.
Use the `ui-designer` style agent if the roster has one; it reports to you.
