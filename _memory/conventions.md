# Conventions

## File naming

- **Pieces:** `YYYY-MM-DD-{type}.html` (e.g. `2026-01-30-reflection.html`). Date and type are extracted by `update-manifest.sh` via regex/sed; must match exactly.
- **Scripts:** `update-manifest.sh`, `deploy.sh` — kebab-case.

## Piece format

- Root element: `<section data-date='YYYY-MM-DD' data-type='{type}'>`.
- Inline `<style>` and `<script>`; no external assets.
- Self-contained; viewer wraps content in a minimal document with viewport and full-height body.
- Design: Taper-inspired — computational poetry, constraint, interaction/generativity; one idea per piece.

## Code style

- **Shell:** Bash, `set -e` in deploy/update scripts; portable `stat` for mtime (macOS vs Linux).
- **HTML/JS in pieces:** Minimal; often minified or compact for aesthetic; no framework.

## Git

- Commit messages: conventional style (e.g. `feat: add 2026-01-30 pieces`). `update-manifest.sh` auto-commits with that pattern when it pushes.

## Architecture rule

- **Only add** under `pieces/`. Do not change the viewer or manifest builder.
