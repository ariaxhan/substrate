# Taper Site Pieces Audit

**Date:** 2026-02-01
**Total HTML files:** 32
**Auditor:** Claude (automated scan)

---

## Summary

All 32 HTML files have been read and verified. **Every file contains valid HTML/CSS artwork** -- none are truncated, empty, error blobs, or malformed. No file contains error text or placeholder content instead of actual creative output.

---

## Size Distribution

| Range | Count | Files |
|-------|-------|-------|
| < 1 KB | 3 | 2026-01-28-pulse (652B), 2026-01-28-morning (803B), 2026-01-28-spark (960B) |
| 1-2 KB | 10 | 2026-01-28-genesis, shift, encouragement, winddown, reflection, maintain; 2026-01-30-shift; 2026-01-29-encouragement; 2026-01-30-encouragement, winddown |
| 2-3 KB | 8 | 2026-01-29-morning, shift, winddown, pulse, reflection; 2026-02-01-morning; 2026-01-31-pulse; 2026-01-30-digest |
| 3+ KB | 11 | 2026-01-30-morning, pulse, spark; 2026-01-29-digest, spark; 2026-01-28-digest; 2026-01-31-winddown, digest, shift, reflection, encouragement |

### Files Under 200 Bytes

**None.** The smallest file is `2026-01-28-pulse.html` at 652 bytes, which is a complete and valid animated piece (sliding dot on a bar with "MIDPOINT" text).

---

## Structural Validation (All Files)

Every file was checked for:
1. Wrapped in `<section data-date='' data-type=''>` tags
2. Contains a `<style>` block with CSS
3. Contains visual content (HTML elements and/or `<script>` with canvas/DOM manipulation)
4. Not truncated (proper closing tags present)

| File | Style | Content | Script | Valid |
|------|-------|---------|--------|-------|
| 2026-01-28-spark | yes | canvas | yes | yes |
| 2026-01-28-digest | yes | canvas+DOM | yes | yes |
| 2026-01-28-morning | yes | text/poetry | no | yes |
| 2026-01-28-pulse | yes | animated divs | no | yes |
| 2026-01-28-shift | yes | rotating boxes | no | yes |
| 2026-01-28-encouragement | yes | breathing text | no | yes |
| 2026-01-28-winddown | yes | gradient sky | no | yes |
| 2026-01-28-reflection | yes | animated stars | no | yes |
| 2026-01-28-genesis | yes | floating words | yes | yes |
| 2026-01-28-maintain | yes | canvas orbits | yes | yes |
| 2026-01-29-morning | yes | revealing text | yes | yes |
| 2026-01-29-encouragement | yes | glow + phrases | yes | yes |
| 2026-01-29-shift | yes | rotating grid | yes | yes |
| 2026-01-29-winddown | yes | lamp dimming | yes | yes |
| 2026-01-29-pulse | yes | balance beam | yes | yes |
| 2026-01-29-reflection | yes | star canvas | yes | yes |
| 2026-01-29-digest | yes | 3D node graph | yes | yes |
| 2026-01-29-spark | yes | colliding orbs | yes | yes |
| 2026-01-30-morning | yes | dawn canvas | yes | yes |
| 2026-01-30-encouragement | yes | scrolling text | yes | yes |
| 2026-01-30-shift | yes | inverting text | yes | yes |
| 2026-01-30-winddown | yes | star canvas | yes | yes |
| 2026-01-30-pulse | yes | balance slider | yes | yes |
| 2026-01-30-spark | yes | merging words | yes | yes |
| 2026-01-30-digest | yes | node network | yes | yes |
| 2026-01-31-pulse | yes | balance/tilt | yes | yes |
| 2026-01-31-encouragement | yes | particle glow | yes | yes |
| 2026-01-31-winddown | yes | ember settling | yes | yes |
| 2026-01-31-shift | yes | ambigrams | yes | yes |
| 2026-01-31-digest | yes | node graph | yes | yes |
| 2026-01-31-reflection | yes | star placing | yes | yes |
| 2026-02-01-morning | yes | dawn words | yes | yes |

---

## Broken / Suspicious Files

**None found.** All 32 files are well-formed taper art pieces.

---

## Missing Pieces by Date

Expected piece types per day: morning, spark, encouragement, shift, pulse, winddown, reflection, digest (8 types, plus occasional specials like genesis/maintain).

| Date | Missing Types |
|------|---------------|
| 2026-01-28 | none (has 10 pieces including genesis + maintain specials) |
| 2026-01-29 | none (has all 8 standard types) |
| 2026-01-30 | spark (present), reflection (MISSING) |
| 2026-01-31 | morning (MISSING), spark (MISSING) |
| 2026-02-01 | only morning exists (rest of day not yet generated) |

---

## Quality Notes

- **Jan 28 pieces** are smaller/simpler (CSS-only animations, short poems). This is expected as the "genesis" day.
- **Jan 29-31 pieces** show progressive complexity -- more canvas work, particle systems, interactive elements.
- **Jan 31 encouragement** is the largest piece at 5,306 bytes, featuring a full particle system with phrase revealing.
- **Feb 01 morning** is solid at 2,688 bytes with a dawn progression mechanic.
- All files consistently use the `<section data-date data-type>` wrapper convention.
- No files contain error messages, stack traces, or placeholder text.

---

## Verdict

**All existing pieces are healthy.** No broken, truncated, or malformed content detected. The only gap is missing pieces for 2026-01-30 (reflection) and 2026-01-31 (morning, spark), which may not have been generated yet.
