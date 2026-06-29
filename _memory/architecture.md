# Architecture

## Overview

substrate is a static Taper-style gallery: a single HTML viewer loads a JSON manifest and displays each piece in an iframe. No server, no build step, no database.

## Structure

```
substrate-repo/
├── index.html           # Viewer (STATIC — do not modify)
├── update-manifest.sh   # Rebuilds manifest + optional git push (STATIC — do not modify)
├── deploy.sh            # Runs update-manifest.sh then wrangler pages deploy
├── pieces/
│   ├── manifest.json    # Auto-generated; list of { file, date, type, timestamp }
│   └── YYYY-MM-DD-*.html # One file per piece (ONLY ADD HERE)
├── .claude/             # KERNEL-REPO config
├── _meta/               # Session state
└── _memory/             # Project memory
```

## Data flow

1. **Manifest:** `update-manifest.sh` scans `pieces/*.html`, parses filename as `YYYY-MM-DD-type`, uses file mtime as timestamp; writes `pieces/manifest.json`.
2. **Viewer:** `index.html` fetches `pieces/manifest.json`, sorts pieces by timestamp (newest first), loads current piece in an iframe via `srcdoc` (wraps piece HTML in a minimal document).
3. **Navigation:** Keyboard (arrows, space, 1–9, Home/End, R, ?), touch (swipe, edge zones, tap zones), URL hash `#N` for deep link to piece N.
4. **Deploy:** `deploy.sh` runs `update-manifest.sh` then `wrangler pages deploy . --project-name substrate`. Alternatively: push to GitHub and use Cloudflare Pages Git integration.

## Entry points

- **User-facing:** `index.html` — open in browser or serve as static root.
- **Automation:** `update-manifest.sh` (after adding pieces); `deploy.sh` (full deploy).

## External services

- **Cloudflare Pages** — hosting (nexus-substrate.pages.dev). Optional: Wrangler CLI or Git-based deploy.

## Invariants

- **Never modify:** `index.html`, `update-manifest.sh`.
- **Only add:** files under `pieces/*.html`; then run `update-manifest.sh`.
