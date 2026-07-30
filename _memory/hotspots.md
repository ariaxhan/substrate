---
type: note
status: active
created: 2026-01-30
---

# Hotspots

Areas that are complex or sensitive. Change with care.

## index.html (~900 lines)

- **Role:** Single-file viewer: manifest fetch, iframe management, preload cache, keyboard/touch/swipe nav, URL state, offline/error states, progress bar, shortcuts overlay.
- **Risk:** Core UX and architecture invariant. Do not modify; only add under `pieces/`.
- **If you must touch it (e.g. bugfix):** Read full script block; test keyboard, touch, and offline; ensure manifest path and piece document builder stay correct.

## update-manifest.sh

- **Role:** Scans `pieces/*.html`, builds `manifest.json`, optionally git add/commit/push.
- **Risk:** Filename parsing and `stat` portability (macOS vs Linux). Do not modify per README; if manifest format changes, viewer must stay in sync.
- **Note:** `stat -f "%m"` (macOS) vs `stat -c "%Y"` (Linux) is already handled.

## pieces/*.html

- **Role:** Content. Sizes and complexity vary (small minimal pieces to larger canvas/JS).
- **Risk:** Low; add-only. Ensure filename is `YYYY-MM-DD-{type}.html` and root is `<section data-date=... data-type=...>` so viewer and manifest stay consistent.
