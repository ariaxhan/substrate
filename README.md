# Substrate

**A generative art gallery. Every piece is one self-contained HTML file, written by Claude.**

Live: [nexus-substrate.pages.dev](https://nexus-substrate.pages.dev)

---

## The whole idea in one line

**Every day, a handful of scheduled jobs each generate exactly one HTML file** — a tiny,
self-contained, interactive artwork — and drop it into `pieces/`. The gallery is just those
files, accumulating. Nothing is ever edited; the collection only grows, one file at a time.

That single-file constraint is the entire point. One `<section>`, inline `<style>` and
`<script>`, no external assets, under ~4KB, has to do something when you touch it. A piece that
needs a second file isn't a substrate piece.

---

## Where it comes from: Taper

Substrate is a direct descendant of **[Taper](https://taper.badquar.to/)** — a literary magazine
for *computational poetry*: tiny generative/interactive poems where every piece must fit in
**under 2KB** and ships as a single self-contained HTML file. Taper's whole aesthetic is that the
constraint *is* the creative force — the poem lives in the algorithm and the interaction, not just
the words.

Substrate takes that exact discipline and automates it. Instead of a human poet submitting to an
issue, a Claude model generates a piece every few hours and the gallery publishes itself.

**Source material.** Each generation is seeded with a curated set of *real* Taper pieces (the
samples from [Taper #11](https://taper.badquar.to/11/) and others) as reference — palettes,
typography tricks, motion, the way a single interaction can carry a whole poem. The model studies
those, then makes something new. It's lineage, not copying: same constraints, same spirit, fresh
output every time.

> Credit where due: the form, the under-2KB ethic, and the "one file, one idea, maximum impact
> from minimum means" philosophy are all **Taper's** (taper.badquar.to). Substrate is an homage
> built on top of it.

---

## How a piece is born (the actual pipeline)

There is **no inbox to watch and no human in the loop**. It's just timers running scripts.

```
A scheduled timer fires (e.g. 12:00, "midday-pulse")
   ↓
The job script reads registry.json → learns which piece type to make (slug: "pulse")
   ↓
Claude generates ONE file:  pieces/2026-06-29-pulse.html
   (a complete <section> with inline style + script, under ~4KB, interactive)
   ↓
update-manifest.sh rebuilds pieces/manifest.json from the filenames
   ↓
The gallery is pushed to GitHub (ariaxhan/substrate)
   ↓
Cloudflare Pages auto-deploys → nexus-substrate.pages.dev
```

Each run writes **exactly one new file** and touches nothing else. That invariant is what keeps
the system simple enough to run unattended for months.

The same daily jobs also send a plain-text email (briefing / reflection / etc.) — the art piece is
generated alongside the email in the same run. The emails are the heartbeat; the gallery is the
visible exhaust.

### The daily rhythm

| Time | Job | Piece file written |
|------|-----|--------------------|
| 07:00 | morning briefing | `YYYY-MM-DD-morning.html` |
| 09:00 | creative spark | `YYYY-MM-DD-spark.html` |
| 12:00 | midday pulse | `YYYY-MM-DD-pulse.html` |
| 15:00 | research digest | `YYYY-MM-DD-digest.html` |
| 20:00 | evening reflection | `YYYY-MM-DD-reflection.html` |

≈5 files a day. No human writes any of the code. That's how the gallery passed 390+ pieces.

---

## Architecture

```
substrate/
├── index.html           # STATIC viewer — loads manifest, shows pieces in iframes. DO NOT MODIFY.
├── update-manifest.sh   # STATIC — rebuilds manifest.json, commits, pushes. DO NOT MODIFY.
├── deploy.sh            # Manual deploy via wrangler.
├── pieces/              # DYNAMIC — one HTML file per generated piece (390+).
│   ├── manifest.json    # Auto-built index (date, type, timestamp). Never hand-edit.
│   ├── 2026-06-29-pulse.html
│   ├── 2026-06-29-morning.html
│   └── ...
└── README.md
```

### The one invariant

```
NEVER MODIFY:  index.html, update-manifest.sh, manifest.json
ONLY EVER ADD: pieces/*.html   (exactly one new file per run)
```

The viewer is static. The pieces are dynamic. The model only ever *adds* a file — it never
rewrites the gallery, never touches the viewer, never edits an existing piece. Everything the
system does reduces to "write one more HTML file, then rebuild the index."

---

## What every piece must be

Inherited straight from Taper:

| Principle | What it means here |
|-----------|--------------------|
| **One file** | A single `<section>` with inline `<style>` + `<script>`. No external assets. |
| **Small** | Under ~4KB. The squeeze is the craft. |
| **Interactive or generative** | It must *respond* (click / hover / mousemove / time) or evolve — never a static poster. |
| **Abstract** | A poem in code, not an article or a UI. Meaning through form and motion. |
| **Self-contained** | Works offline, depends on nothing, carries its whole world inside it. |

**What varies:** palette, typography, motion, the interaction model, mood, complexity. There is
no house style — like Taper, the only constant is the constraint.

---

## Viewing

**Keyboard:** `←`/`→` prev/next · `R` random · `F` fullscreen · `H` help · `1-9` jump to piece.
**Touch:** swipe to navigate · tap edges for prev/next · long-press for random.

---

## Deploy

Auto-deploys on every push via Cloudflare Pages (Git integration on `ariaxhan/substrate`, `main`).

Manual:
```bash
wrangler pages deploy . --project-name nexus-substrate
```

---

*Gallery generated by Claude, one HTML file at a time. Built in the lineage of
[Taper](https://taper.badquar.to/).*
