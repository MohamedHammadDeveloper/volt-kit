# NN: {{Title}}: one-line outcome

> **Status:** draft | ✅ approved by the owner YYYY-MM-DD (answers/changes he made) | building | shipped | parked. One line on what is built so far (NN-1 started).
> **Sources:** [[NN-name/A-architecture|A-architecture]] · [[NN-name/B-product|B-product]] · [[NN-name/A-review-of-B|A-review-of-B]] · [[NN-name/B-review-of-A|B-review-of-A]] (omit if no debate)
> **Back to:** [[related-spec]] · [[home]]

## 1) The idea in the owner's words
Two to four lines, as he said it. Then **corrections** to the request where a word means something else in the code.

## 2) What we reuse (no new infrastructure if avoidable)
| Existing | Where (file/module) | How it is used |
|---|---|---|
| ... | `path/to/file` | ... |

**What we do not touch:** modules and tables left alone. **Zero changes to core system tables.**

## 3) Agreed design
### 3.1 Data / kinds / catalog (data, not code)
### 3.2 The record and its fields
| Field | Required? | Notes |
|---|---|---|
### 3.3 Who / audience / permissions
Action keys table: key, risk, what it allows, default roles. Where the check happens (route vs inside the service).
### 3.4 Behaviour, scheduling, delivery guarantees
### 3.5 Security and visibility (the most important point)
What can leak, and the rule that prevents it; the mandatory leak test.
### 3.6 Screens, widgets, notifications
Screen count (fewer screens, tabs), dialogs, empty/loading/error states, wording language.
### 3.7 Tables (migration, expand-only) and routes
| Table | Main columns |
|---|---|
| Route | Action |
|---|---|
### 3.8 Audit and limits
Audit event names (identifiers only); limits as named constants.

## 4) Stages (each ships alone: version, changelog, vault update, graph refresh)
> Real screenshots to the owner before any release: list the screens.

| Stage | Contents | Migration | Docs / lessons | Model | Depends on |
|---|---|---|---|---|---|
| NN-1 foundation | ... | NNNN_name | lesson X, all languages | strong for security/scheduling, default otherwise | none |
| NN-2 | ... | none | ... | default | NN-1 |

- **Test caps:** NN-1: `test_x.py` ≤ N, `test_x_schema.py` ≤ N, `test_x_no_leak.py` ≤ N, plus pinned-count files touched.
- **Parallelism:** which stages are independent (separate agents, separate files).
- **Constraints:** what is not a channel/feature yet and why.

## 5) Risks
1. Risk: mitigation.

## 6) Questions for the owner (each with a recommendation)
1. Question? **Recommendation:** ... (after answering: ✅ decision, date)

## 7) Out of scope now
- Item (and where it will be discussed instead).

## Dropped or changed from the approved spec
(Name every item explicitly; empty means nothing was dropped.)
