---
type: note
status: active
created: 2026-01-30
---

# substrate — Project Intelligence

## compression — mandatory

minimum text. zero meaningful loss.

* default: bullets + fragments.
* prose only when structure would lose meaning.
* delete anything removable.
* merge anything redundant.
* shorten anything compressible.
* never narrate work; report results, evidence, blockers, decisions.
* preserve correctness, clarity, decisions, evidence, uncertainty, action.
* length follows information. never pad; never omit.

before emitting:

1. convert prose → bullets/fragments wherever lossless.
2. delete every removable word, sentence, bullet, section, preamble, recap, transition, or explanation.
3. repeat until further compression would lose meaning.

do not emit while removable text remains.

verbosity is a defect.
omission is also a defect.

## Philosophy

**CORRECTNESS > SPEED**
One working implementation beats three debug cycles.
Think before typing. Simulate before running.

**INVESTIGATE BEFORE IMPLEMENT**
Never assume. Search for existing patterns first.
Copy what works. Adapt minimally.

**PROTECT STATE**
Backup before mutation.
Confirm before deletion.

**ARCHITECTURE INVARIANT (CRITICAL)**
Never modify `index.html` or `update-manifest.sh`.
Only add `pieces/*.html`. The viewer is static; pieces are dynamic.

---

## Project

- **Name:** substrate
- **Description:** Taper-style generative gallery. Accumulates abstract HTML pieces from daily emails.
- **Stack:** Static HTML, shell scripts, Cloudflare Pages. No build step, no package.json.
- **Entry point:** `index.html` (viewer; loads `pieces/manifest.json`, displays pieces in iframes).

---

## Architecture

- **Viewer:** `index.html` — fetches `pieces/manifest.json`, loads each piece in an iframe; keyboard/touch nav, progress, offline handling. Do not modify.
- **Pieces:** `pieces/YYYY-MM-DD-{type}.html` — self-contained `<section>` with inline `<style>` and `<script>`; one file per email piece. Only add here.
- **Manifest:** `pieces/manifest.json` — built by `update-manifest.sh` from filenames (date, type, timestamp). Do not edit by hand.
- **Scripts:** `update-manifest.sh` (rebuild manifest, optional git push); `deploy.sh` (update manifest + `wrangler pages deploy`). Do not modify.

---

## Conventions

1. **Piece naming:** `YYYY-MM-DD-{type}.html` (e.g. `2026-01-30-reflection.html`).
2. **Piece format:** Root `<section data-date='...' data-type='...'>`, inline styles/scripts, self-contained; design from Taper reference (computational poetry, constraint, interaction).
3. **Adding content:** Create exactly one new file under `pieces/`, then run `./update-manifest.sh`.
4. **Branch prefix:** `feat/` or `fix/` (from existing commit style).

---

## Memory Protocol

Check before implementing:

- `_memory/architecture.md` — structure and data flow
- `_memory/conventions.md` — naming and patterns
- `_memory/decisions.md` — why things are as they are
- `_memory/bugs.md` — past bugs and fixes
- `_meta/context/active.md` — current session focus

---

## Session

**Start:** Read `_meta/context/active.md`, `_memory/architecture.md`, then `git status`.
**During:** Update `active.md`; log learnings to `_meta/_learnings.md`.
**End:** No automated git; commit/push as needed.

---

## Commands

- **Deploy (local):** `./deploy.sh` (requires `wrangler` and `wrangler login`).
- **Register new pieces:** `./update-manifest.sh`.
- **No test/lint/type commands** — static site; validate by opening `index.html` in a browser or deploying.

---

## Defaults

- Prefer clarity over cleverness; existing patterns over new inventions.
- When uncertain: read `_memory/` and README.md, then ask.
