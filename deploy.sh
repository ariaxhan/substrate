#!/bin/bash
# Deploy taper-site to Cloudflare Pages
# Requires: npm install -g wrangler && wrangler login

set -e

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$SITE_DIR"

# Update manifest first
bash update-manifest.sh

# Deploy
echo "Deploying to Cloudflare Pages..."
wrangler pages deploy . --project-name nexus-substrate --commit-dirty=true

echo "Done. Site live at https://nexus-substrate.pages.dev"
