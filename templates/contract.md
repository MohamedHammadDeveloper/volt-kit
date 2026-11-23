# NN-k: interface contract (for the frontend)

> **Reference:** [[NN-name]] sections 3 and 4. Server code: `{{path/to/feature}}`.
> Rules: who may call (all routes internal to members unless stated); time format (ISO-8601 with offset); errors are always `{code, message, details}` with a localised `message`; invisible or missing means `404 not_found` in the same shape. Neither side edits this file; ask the lead.

## 1) Action keys (generated constants file)
| Key | What it unlocks in the UI |
|---|---|
| `feature.view` | read screens, widget, notifications. Default: all roles |
| `feature.create` | nav item, "new" dialog |
The UI hides what the user may not do; the server rejects anyway with `403 forbidden` and `details.missing`.

## 2) Shared shapes
```json
// Kind
{"id": 1, "name": "...", "color": "palette-key", "icon": "icon-key", "is_default": true}
// Attachment, read with the requester's own eyes; null = none
{"kind": "document", "available": true, "id": "...", "name": "..."}
{"kind": "document", "available": false, "gone": false}   // hidden from requester: no id, name or link
// View shown in lists/cards
{"id": "uuid", "title": "...", "status": "active|ended|cancelled", "...": "..."}
```
Notes on every field that is nullable, enumerated or derived.

## 3) Endpoints
| Method and path | Action | Request | Response | Errors |
|---|---|---|---|---|
| `GET /things` | view | query `?scope=mine&status=` | `{"items": [...], "total": N}` | |
| `POST /things` | create | `{"title", ...}` | `201 Thing` | `422 thing_in_past`, `429 thing_rate_limited` |

## 4) Error codes
| Code | HTTP | Meaning | `details` |
|---|---|---|---|

## 5) Behaviour the UI relies on
Polling interval, ordering, what "ended" means, idempotency, limits (title 80, note 500, etc.).

## Change log
- YYYY-MM-DD: created
