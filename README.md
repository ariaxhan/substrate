# substrate

Taper-style generative gallery. Accumulates abstract HTML pieces from daily emails.

## CRITICAL: Architecture Invariant

```
NEVER MODIFY:
- index.html (static viewer with keyboard navigation)
- update-manifest.sh (static manifest builder)

ONLY ADD:
- pieces/*.html (one file per email, auto-generated)
```

**The viewer is static. Pieces are dynamic.**

Each email script ONLY:
1. Creates ONE new file: `pieces/YYYY-MM-DD-{type}.html`
2. Calls `update-manifest.sh` (which rebuilds manifest + pushes to GitHub)

That's it. No touching index.html. No custom loaders. No special cases.

## Structure

```
taper-site/
├── index.html         # STATIC - keyboard nav viewer (DO NOT MODIFY)
├── update-manifest.sh # STATIC - rebuilds manifest + git push (DO NOT MODIFY)
├── pieces/            # DYNAMIC - generated pieces
│   ├── manifest.json  # Auto-rebuilt by update-manifest.sh
│   └── *.html         # One per email (ONLY ADD HERE)
└── README.md
```

## Deploy to Cloudflare Pages

### Option 1: Direct Upload

1. Go to https://dash.cloudflare.com
2. Pages > Create a project > Direct Upload
3. Upload the `taper-site` folder
4. Done. You'll get a URL like `substrate.pages.dev`

### Option 2: Git Integration

1. Push `taper-site` to a GitHub repo
2. Connect repo to Cloudflare Pages
3. Build command: (none)
4. Output directory: `/`
5. Each git push auto-deploys

### Option 3: Wrangler CLI

```bash
npm install -g wrangler
wrangler login
cd /Users/ariaxhan/Downloads/Vaults/_meta/services/taper-site
wrangler pages deploy . --project-name substrate
```

## How Pieces Are Generated

Each email script:
1. Sends plain text email
2. Generates a Taper-style HTML piece
3. Writes piece to `pieces/{date}-{type}.html`
4. Calls `update-manifest.sh` to register it

Pieces accumulate. Site displays newest first.

## Manual Piece Generation

```bash
# Generate a test piece
cd /Users/ariaxhan/Downloads/Vaults/CollabVault
/Users/ariaxhan/.claude/local/claude --model sonnet -p "
Generate a Taper-style HTML piece.

Theme: [your theme]

Use CollabVault/knowledge/reference/taper/taper-raw-references.md for inspiration.
Create a self-contained HTML section (under 4KB). One idea, abstract, interactive.
Output ONLY <section>...</section>.
Include inline <style> and <script>.
Add data-date='$(date +%Y-%m-%d)' data-type='test'.

Write to: /Users/ariaxhan/Downloads/Vaults/_meta/services/taper-site/pieces/$(date +%Y-%m-%d)-test.html
"

# Update manifest
bash /Users/ariaxhan/Downloads/Vaults/_meta/services/taper-site/update-manifest.sh
```

## Sync to Cloudflare

After pieces accumulate, redeploy:

```bash
wrangler pages deploy . --project-name substrate
```

Or set up a cron job to auto-sync nightly:

```bash
# Add to crontab -e:
0 23 * * * cd /path/to/taper-site && wrangler pages deploy . --project-name substrate
```

## Design Philosophy

Pieces are inspired by the Taper reference (see `CollabVault/knowledge/reference/taper/taper-raw-references.md`). Core essence:

- **Computational poetry**: meaning through form, algorithm, and interaction; the medium is part of the message
- **Constraint as creative force**: single file, no external assets; one idea, maximum impact, minimum means
- **Abstract and experiential**: not an article, not a brief, not literal content — a poem in code
- **Interaction or generativity**: the piece responds (click, hover, mousemove, time) or generates; discovery, not a static poster
- **Self-contained**: one HTML file, inline style and script; slightly larger is fine (e.g. under 4KB)

Style, palette, and typography vary; the reference shows Taper is not one look.
