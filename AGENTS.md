# AGENTS.md — Course Advertisement Posters

This repository contains print-ready promotional posters for courses in the
**Department of Computer and Information Science at Allegheny College**. Read
this file before editing an existing poster, adding a course, or changing the
build workflow.

The canonical implementation is `document-engineering/`. Keep new posters
structurally consistent with it.

## Non-negotiable rules

- **Format:** one page, US Letter portrait, 8.5 × 11 in.
- **Edit the source, not the output:** change `poster.html` and rebuild. Never
  edit the PDF or PNG directly.
- **Commit both source and deliverables:** poster HTML, assets, final PDF,
  final 300 DPI PNG, and `preview.png`.
- **Do not commit `build/`:** it holds generated intermediates and is ignored.
- **No emojis:** use inline SVG icons or the repo’s SVG artwork.
- **Use numerals for counts on the poster:** “3 modules,” “12 demos,”
  “3 projects” — not “Three modules.”
- **Grammar:** the wordmark is plural, so the CTA is “Become one of the
  Prosegrammers,” not “Become a.”
- **Keep “Spring 2027” bold and visible:** it appears in the top-bar pill, the
  hero kicker, and the footer label.
- **AI tools:** Document Engineering lists GitHub Copilot, **Pi Coding Agent**,
  and OpenCode. Gemini CLI is deprecated; do not add it back.
- **Facts:** keep course code, term, dates, times, rooms, instructor, credits,
  prerequisites, and distribution requirements accurate against the syllabus
  and the registrar’s schedule.

## Repository layout

```text
course-advertisement-posters/
├── AGENTS.md
├── README.md
├── .gitignore
└── document-engineering/
    ├── README.md
    ├── poster.html
    ├── build.sh
    ├── CMPSC104-Document-Engineering-Spring2027.pdf
    ├── CMPSC104-Document-Engineering-Spring2027.png
    ├── preview.png
    ├── assets/
    │   ├── astronaut.svg
    │   ├── prosegrammers-logo.svg
    │   ├── wordmark.svg
    │   ├── wordmark-light.svg
    │   ├── qr-prosegrammers.svg
    │   ├── qr-prosegrammers.png
    │   └── fonts/
    └── build/                 # generated, git-ignored
```

Each course gets a top-level directory containing its own source, assets,
build script, final PDF/PNG, preview, and README. The root README indexes the
posters and documents the shared design system.

## Toolchain

Required:

- Bash
- Chromium, Chromium Browser, or Google Chrome
- `pdftoppm` from Poppler (`poppler-utils`)
- Python 3 + Pillow for image checks (optional but recommended)

Fonts are local in `assets/fonts/`; do not replace them with remote fonts. The
poster must render identically offline.

## Build workflow

From the repository root:

```bash
./document-engineering/build.sh
```

From the course directory:

```bash
cd document-engineering
./build.sh
```

The script:

1. Renders `poster.html` to `build/poster.pdf` with headless Chromium.
2. Rasterizes a 300 DPI `build/poster.png`.
3. Rasterizes a smaller `build/poster-preview.png`.
4. Copies the final PDF, PNG, and preview to the course folder as
   `CMPSC104-Document-Engineering-Spring2027.pdf`,
   `CMPSC104-Document-Engineering-Spring2027.png`, and `preview.png`.

## Page architecture

`.page` is a fixed `8.5in × 11in` flex column with `overflow: hidden`. The
vertical budget is:

| Block | Height |
| --- | --- |
| Top bar (A) | `0.40in` |
| Hero (B) | `3.82in` |
| Pipeline (C) | `0.86in` |
| Learn (D) | flexes to fill the rest (~`3.06in`) |
| Toolkit (E) | `0.86in` |
| Footer (F) | `2.00in` |
| **Total** | **`11.00in`** |

If you add text, badges, or artwork, check that the footer still lands on the
page. Adjust another block’s height rather than letting the page overflow. The
browser’s `getBoundingClientRect()` is a fast way to measure the hero, badges,
pipeline, and footer.

Layout margins:

- Side padding: `0.42in`
- Footer top/bottom padding: `0.26in`
- Full-bleed backgrounds: top bar, pipeline, footer, and the hero arch
- Keep body text inside the `0.42in` side margins; full-bleed areas are
  backgrounds only.

## Poster anatomy (blocks A–F)

### A — Top bar

- Left: “Allegheny College · Computer & Information Science” in small mono.
- Right: **Spring 2027** in a bold gold pill (`8.1pt`, weight 700, gold border).
- The term must remain the most visible text in the bar.

### B — Hero

- Kicker: `CMPSC 104` pill, **Spring 2027** in bold plum, and “A Prosegrammers
  course” in violet.
- Title: “DOCUMENT” / “ENGINEERING,” `63pt` Bricolage Grotesque ExtraBold,
  `line-height: 0.82`, `letter-spacing: -0.05em`.
- Tagline: “Where *prose* meets *programming*.” with blue marker underlines.
- Intro: a balanced 5-line paragraph. It must sell the course and include the
  career-readiness / industry-standard-tools sentence. Do not leave an orphan
  word on the last line, and do not let the text collide with the sticker.
- Badges: `4 credits`, `HE + SP`, `Project-based`, `Hands-on`,
  `Applied learning` (5 pills, one row).
- Art: plum arch, astronaut, orbit line, SVG stars, and the gold
  “NO PREREQUISITE” sticker.

### C — Pipeline

Dark plum band with 4 steps and inline SVG icons/arrows:

1. Write — Markdown + Python
2. Version — Git + GitHub
3. Build — Quarto + RevealJS
4. Publish — Web + PDF

### D — Learn

- Header: “What you’ll learn” and the note
  “**3 modules · 12 demos · 3 projects**.”
- 3 cards, each with:
  - `MODULE 01/02/03` in a mono label
  - heading (`FOUNDATIONS`, `BUILDING BLOCKS`, `ADVANCED`)
  - promise line
  - 4 bullets
  - a bottom critique line
- Card accents: blue, gold, violet.
- Footer line: “Also on the syllabus · Diataxis · README-driven dev ·
  localization · Zettelkasten · digital gardens · NLP · regex · search · RAG.”

### E — Toolkit

Lavender band, two rows of six chips:

- Row 1: Python, VS Code, Git, GitHub, Quarto, Markdown
- Row 2: RevealJS, FastAPI, Django, GitHub Copilot, Pi Coding Agent, OpenCode

The 3 AI tools use the dark `chip hot` style with a blue dot.

### F — Footer

- **Spring 2027** (bold gold) · Main Campus
- “January 19 — May 11, 2027”
- Class: T/Th, 9:30 – 10:45 AM, Alden Hall, 109 Lecture
- Lab: Tuesday, 2:30 – 4:00 PM, Alden Hall, 109 Lab
- Quick facts: “Project-based · team presentations · portfolio”
- Instructor: Dr. Gregory M. Kapfhammer, Department of Computer and Information
  Science · Allegheny College
- QR code (1.02 in cream tile) and “Scan to explore”
- CTA: “Become one of the” + light wordmark + `prosegrammers.com`

## Design system

### Color

| Token | Value | Use |
| --- | --- | --- |
| Plum | `#371a45` | Primary brand, dark bands |
| Plum deep | `#2b1136` | Pipeline band |
| Plum soft | `#5d3a74` | Secondary dark |
| Violet | `#7a4e99` | Secondary headlines, icons |
| Paper | `#f9f7fb` | Page background |
| Paper warm | `#fffdf9` | Cards |
| Lilac | `#e9e0f0` | Toolkit band |
| Lilac line | `#d8c9e4` | Borders |
| Blue | `#00aaff` | Highlights, links |
| Blue deep | `#0077b6` | Small text on cream |
| Gold | `#ffc857` | Stickers, rules, calls to action |
| Gold ink | `#956200` | Gold text on cream |

The palette comes from the Prosegrammers course site; keep it consistent unless
a new course has its own approved brand colors. If you introduce a new palette,
document it in that course’s README.

### Type

- Display: Bricolage Grotesque, weight 800 for headlines, 500 for the tagline.
- Body: Inter.
- Labels/code: Ubuntu Mono (400 and 700).
- All fonts are local `.woff2` subsets.

Key sizes:

- Hero title: `63pt`
- Section heading: `19pt`
- Card heading: `14pt`
- Tagline: `17pt`
- Intro: `9.2pt`, `line-height: 1.36`
- Card promise: `8.6pt`
- Card bullets: `8.2pt`
- Badges: `6.2pt`
- Footer times: `10.5pt`
- Footer date: `13pt`
- Small labels: `5.9–7.0pt`

### Shape and detail

- Cards: `0.10in` radius, 1px lilac border, `0.055in` accent top bar.
- Badges: pill radius, uppercase mono, one solid blue badge for “4 credits.”
- Sticker: `1.04in` gold circle, white 2px border, slight rotation and shadow.
- Pipeline: thin gold circle icons, inline SVG, small gold arrows.
- Footer: gold top rule, full bleed, QR in a cream tile.

## Copy rules

- Use numerals for counts: **3 modules**, **12 demos**, **3 projects**.
- Use “**Become one of the Prosegrammers**” with the plural wordmark.
- Keep “Spring 2027” bold in the top bar, hero kicker, and footer.
- The intro must include the career-readiness sentence:
  > Along the way, you’ll use the same industry-standard tools and workflows as
  > professional software teams, building career-ready skills.
- Keep the intro to 5 balanced lines; no orphan last word.
- No emojis. Decorative icons are SVG.
- Spell the department as “Computer and Information Science” in running text;
  the top bar may use “Computer & Information Science” for space.

## Course facts (Document Engineering, Spring 2027)

- Course: **CMPSC 104 — Document Engineering**
- Department: Computer and Information Science, Allegheny College
- Term: Spring 2027, Main Campus
- Class: T/Th, 9:30 – 10:45 AM, Alden Hall, 109 Lecture
- Lab: Tuesday, 2:30 – 4:00 PM, Alden Hall, 109 Lab
- Dates: January 19 — May 11, 2027
- Instructor: Dr. Gregory M. Kapfhammer
- Credits: 4
- Prerequisite: None
- Distribution: HE + SP
- Format: project-based, hands-on, applied learning, team presentations,
  portfolio
- 3 modules, 12 lab demos, 3 module projects
- Module 1: Python fundamentals, Git/GitHub, Quarto + Markdown, docs-as-code;
  critique uv & Quarto
- Module 2: Intermediate Python, AI coding agents, literate programming,
  localization; critique ruff & Django
- Module 3: Advanced Python, context engineering, FastAPI + RAG, Zettelkasten &
  digital gardens; critique ty & FastAPI
- Also on the syllabus: Diataxis, README-driven development, NLP, regex, search,
  RAG
- Tools: Python, VS Code, Git, GitHub, Quarto, Markdown, RevealJS, FastAPI,
  Django, GitHub Copilot, Pi Coding Agent, OpenCode
- Course site: <https://prosegrammers.com/>
- Syllabus: <https://prosegrammers.com/syllabus/>

## Assets and QR code

- `assets/astronaut.svg` — astronaut extracted from the course logo.
- `assets/wordmark-light.svg` — cream wordmark for the dark footer.
- `assets/wordmark.svg` and `assets/prosegrammers-logo.svg` — original/reference
  artwork.
- The astronaut and wordmark are course branding; do not replace them with
  generic clip art for Document Engineering.

The QR code points to `https://prosegrammers.com/` and was generated with Segno
at error correction level H, with a 2-module quiet zone. To regenerate from the
course directory:

```bash
uv run --with segno python - <<'PY'
import segno

qr = segno.make("https://prosegrammers.com/", error="h")
qr.save("assets/qr-prosegrammers.svg", kind="svg", scale=1, border=2,
        dark="#371a45", light="#F9F7FB")
qr.save("assets/qr-prosegrammers.png", kind="png", scale=12, border=2,
        dark="#371a45", light="#F9F7FB")
PY
```

Do not remove the quiet zone (`border=2`) or the cream padding around the QR
tile. After changing the QR, decode it from the rendered poster — not just the
standalone asset.

## QA checklist

Run the build, then check:

- [ ] `preview.png` shows the entire page; no clipped text, cards, or footer.
- [ ] “Spring 2027” is bold and easy to find in the top bar, hero kicker, and
      footer.
- [ ] Intro paragraph is 5 balanced lines and does not touch the sticker.
- [ ] All 5 badges fit on one row: 4 credits, HE + SP, Project-based, Hands-on,
      Applied learning.
- [ ] Learn note says “3 modules · 12 demos · 3 projects.”
- [ ] 3 cards, 4 bullets each, critique lines visible, no overflow.
- [ ] Toolkit has 2 rows and includes GitHub Copilot, Pi Coding Agent, OpenCode.
- [ ] CTA says “Become one of the” above the plural wordmark.
- [ ] Footer has the correct class/lab times, rooms, dates, instructor, and QR.
- [ ] PDF: 1 page, `612 × 792 pt` (US Letter).
- [ ] PNG: `2550 × 3300` at 300 DPI.
- [ ] QR decodes to `https://prosegrammers.com/`.
- [ ] Fonts are embedded; no missing-glyph boxes.
- [ ] `git status` contains only intended changes; `build/` is not staged.

Useful checks:

```bash
pdfinfo document-engineering/CMPSC104-Document-Engineering-Spring2027.pdf \
  | grep -E 'Pages|Page size'

python3 - <<'PY'
from PIL import Image
im = Image.open(
    "document-engineering/CMPSC104-Document-Engineering-Spring2027.png"
)
print(im.size, im.info.get("dpi"))
PY

pdffonts document-engineering/CMPSC104-Document-Engineering-Spring2027.pdf
```

To verify the QR in the rendered poster, crop the QR area and decode it with
OpenCV (`uv run --with opencv-python-headless --with pillow`). It should return
`https://prosegrammers.com/`.

## Adding a new course poster

1. Read this file and the existing course README.
2. Copy the reference folder:

   ```bash
   cp -r document-engineering new-course-name
   ```

3. Rename the PDF/PNG to the new course and term.
4. Update `poster.html`:
   - blocks A–F content
   - title, course code, term, schedule, instructor
   - module cards, toolkit, CTA
   - artwork and QR
5. Update the course `README.md` for the new facts and topic list.
6. Add the course to the table in the root `README.md`.
7. Run `./new-course-name/build.sh`.
8. Work through the QA checklist.
9. Commit the source, assets, final PDF, PNG, and preview.

If a new course has its own brand identity, keep the shared print format and
structure, but document the new palette, artwork, and type choices in that
course’s README.

## Git workflow and gotchas

- `.gitignore` at the root ignores `*/build/`, OS files, and logs.
- The repository owner’s global gitignore ignores `*.pdf` (for LaTeX). The repo
  `.gitignore` re-includes poster deliverables with `!*.pdf` and `!*.png`.
  **Keep those negations** or the PDF will not stage.
- If a deliverable seems ignored, check:

  ```bash
  git check-ignore -v path/to/file
  ```

- Commit source and deliverables together. Example messages:
  - `Add Document Engineering Spring 2027 course poster`
  - `Update Document Engineering poster copy and badges`
- Do not commit `build/`.
- Push to `main` after committing.
- Keep the root README table and this file’s course facts in sync with the
  poster.

## Common problems

- **Footer pushed off the page:** the page is a fixed 11in column. Reduce a
  block height, line count, or font size; verify with a render.
- **Intro collides with the sticker:** keep the intro max-width at `4.55in` or
  move the sticker right; measure with `getBoundingClientRect()`.
- **Card text clipped:** card heights are driven by the learn section’s flex
  height; reduce bullets/copy or adjust another block.
- **PDF is ignored by git:** check the global gitignore and the repo’s `!*.pdf`
  negation.
- **QR will not scan:** keep the 2-module quiet zone, cream tile padding, and
  dark-on-light contrast; test the rendered PNG, not just the SVG.
- **Fonts look wrong:** run the build from the course directory (or use the
  root path), and confirm the `@font-face` URLs still point to
  `assets/fonts/`.
- **Chromium PDF fonts:** Chromium may embed variable display fonts as Type 3
  fonts. They print correctly; the 300 DPI PNG is the raster fallback.
