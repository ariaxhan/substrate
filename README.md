# substrate

Taper-style generative gallery. Accumulates abstract HTML pieces from daily emails.

## Structure

```
taper-site/
├── index.html         # Main gallery page
├── pieces/            # Generated pieces
│   ├── manifest.json  # Piece registry
│   └── *.html         # Individual pieces
├── update-manifest.sh # Rebuilds manifest from pieces/
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
cd /Users/ariaxhan/Downloads/Vaults/.claude/services/taper-site
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

Create a self-contained HTML section under 2KB.
Black background, monospace, abstract.
Output ONLY <section>...</section>.
Include inline <style> and <script>.
Add data-date='$(date +%Y-%m-%d)' data-type='test'.

Write to: /Users/ariaxhan/Downloads/Vaults/.claude/services/taper-site/pieces/$(date +%Y-%m-%d)-test.html
"

# Update manifest
bash /Users/ariaxhan/Downloads/Vaults/.claude/services/taper-site/update-manifest.sh
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

- Black backgrounds
- Monospace typography
- Under 2KB per piece
- Abstract, not literal
- Generative, not static
- Meaning through form
