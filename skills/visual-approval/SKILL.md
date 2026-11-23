---
name: visual-approval
description: Rule for visible UI changes and design work. Use before shipping anything that changes how a screen looks, when working from an approved concept, and when updating help or lessons for a screen.
---
# Visual approval

**Why:** a shell redesign was shipped on the basis of an approved HTML concept: a floating dock was replaced by a full-width bar, top-bar menus were removed, viewer zoom buttons moved. The owner had approved the concept, not each implementation detail, and the work was reverted. Approval of a concept is not approval of the shipped look.

## Rules
1. **No visible change is committed or shipped before the owner sees real screenshots of the running app** (before and after, side by side) and approves.
2. Anything removed or moved, especially things the owner is used to, is shown in a screenshot. If there is more than one item, send them one by one; never ship two large stages together.
3. **The approved concept is the design contract.** In every UI brief: "the concept is the visual reference; any difference is reported, never decided locally". After writing a spec from a concept, give the owner a short list: "in the concept but not built / built differently". When sending interim screenshots say plainly what differs.
4. **Design one screen at a time:** the owner names the screen; a designer agent proposes (notes, a clickable proposal, screenshots) and never edits app code. Fewer screens: related things become tabs of one screen.
5. **Help and lessons follow the screen (strict).** Any front-end change to a page that has a help page, lesson or tutorial updates it in the same change: steps, anchors and texts in every supported language. Either the same agent does it or a follow-up agent before commit; a screen change without it is not done. When reviewing a UI round, check whether a touched page has a lesson and whether the lesson check passes.
6. **Taste rules of the project** (solid surfaces vs gradients, accent colour, density, tone) live in `CONVENTIONS-frontend.md`; honour them.
7. User-facing text uses the UI language and register in `docs/volt-kit.config.md`; no internal names (models, vendors, engines) visible to customers unless the owner allows.
8. **Browser hygiene:** one browser at a time, closed with its child processes after the check; a short smoke of the main path, not every scenario.

## How to apply
Implement, screenshot before and after, send, wait for the answer, then commit. Link to `concept-is-the-contract` style notes in memory when the owner repeats a preference.
