# Dependencies

## Runtime

- **None in-repo.** No package.json, no npm/pip/Cargo. Static HTML and shell only.

## Tooling (optional, for deploy)

- **Wrangler** — Cloudflare CLI. Used by `deploy.sh`: `wrangler pages deploy . --project-name substrate`. Install: `npm install -g wrangler`; then `wrangler login`.
- **Git** — Used by `update-manifest.sh` for add/commit/push after manifest update.

## Hosting

- **Cloudflare Pages** — Project name: `substrate`. URL: https://substrate.pages.dev. Deploy via Wrangler or Git integration (build command: none; output: `/`).

## Environment

- No `.env` or environment variables in the repo. Wrangler auth is via `wrangler login` (local).
