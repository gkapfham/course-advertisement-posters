# AGENTS.md — Course Advertisement Posters

This repository contains print-ready promotional posters for courses in the
**Department of Computer and Information Science at Allegheny College**. Read
this file before editing a poster, adding a course, or changing the build
workflow.

Two reference implementations live here:

- `document-engineering/` — the canonical layout, Bricolage Grotesque, and the
  plum / violet / blue / gold palette.
- `proofgrammers/` — the second palette and display face: Space Grotesk,
  aubergine / mauve / orchid / ivory, with the circuit-board elephant.

Keep new posters structurally consistent with these, while giving each course
its own display face, palette, and artwork.

## Non-negotiable rules

- **Format:** one page, US Letter portrait, 8.5 × 11 in.
- **Edit the source, not the output:** change `poster.html` and rebuild. Never
  edit the PDF or PNG directly.
- **Commit both source and deliverables:** poster HTML, assets, final PDF,
  final 300 DPI PNG, and `preview.png`.
- **Do not commit `build/`:** it holds generated intermediates and is ignored.
- **No emojis:** use inline SVG icons or the repo’s SVG/PNG artwork.
- **Use numerals for counts on posters:** “3 modules,” “12 demos,” “3 projects,”
  “14 chapters” — not “Three modules.”
- **Plural wordmarks:** use “Become one of the …” with the plural course name,
  not “Become a …”.
- **Keep the term bold and visible:** it appears in the top-bar pill, the hero
  kicker, and the footer label.
- **AI tools:** both current posters list GitHub Copilot, **Pi Coding Agent**,
  and OpenCode. Gemini CLI is deprecated; do not add it back.
- **Facts:** keep course code, term, dates, times, rooms, instructor, credits,
  prerequisites, and distribution requirements accurate against the syllabus
  and the registrar’s schedule. Do not invent an instructor for a course the
  owner is not teaching.

## Repository layout

```text
course-advertisement-posters/
├── AGENTS.md
├── README.md
├── .gitignore
├── document-engineering/
│   ├── README.md
│   ├── poster.html
│   ├── build.sh
│   ├── CMPSC104-Document-Engineering-Spring2027.pdf
│   ├── CMPSC104-Document-Engineering-Spring2027.png
│   ├── preview.png
│   └── assets/
└── proofgrammers/
    ├── README.md
    ├── poster.html
    ├── build.sh
    ├── CMPSC204-Theoretical-Machines-Fall2025.pdf
    ├── CMPSC204-Theoretical-Machines-Fall2025.png
    ├── preview.png
    └── assets/
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

Fonts are local in each course’s `assets/fonts/`; do not replace them with
remote fonts. The poster must render identically offline.

## Build workflow

From the repository root:

```bash
./document-engineering/build.sh
./proofgrammers/build.sh
```

From a course directory:

```bash
cd proofgrammers
./build.sh
```

Each script:

1. Renders `poster.html` to `build/poster.pdf` with headless Chromium.
2. Rasterizes a 300 DPI `build/poster.png`.
3. Rasterizes a smaller `build/poster-preview.png`.
4. Copies the final PDF, PNG, and preview to the course folder with
   course-specific filenames.

## Page architecture

`.page` is a fixed `8.5in × 11in` flex column with `overflow: hidden`. The
vertical budget must total 11.00in.

| Block | Document Engineering | Theoretical Machines |
| --- | --- | --- |
| Top bar (A) | `0.40in` | `0.40in` |
| Hero (B) | `3.82in` | `3.82in` |
| Pipeline (C) | `0.86in` | `0.86in` |
| Learn (D) | flexes (~`3.06in`) | flexes (~`2.98in`) |
| Toolkit (E) | `0.86in` | `0.86in` |
| Footer (F) | `2.00in` | `2.08in` |
| **Total** | **`11.00in`** | **`11.00in`** |

If you add text, badges, or artwork, check that the footer still lands on the
page. Adjust another block’s height rather than letting the page overflow. The
browser’s `getBoundingClientRect()` is a fast way to measure the hero, badges,
pipeline, and footer.

Layout margins:

- Side padding: `0.42in`
- Footer padding: `0.26in` top/bottom for Document Engineering; `0.22in` for
  Theoretical Machines.
- Full-bleed backgrounds: top bar, pipeline, footer, and the hero arch.
- Keep body text inside the `0.42in` side margins; full-bleed areas are
  backgrounds only.

## Poster anatomy (blocks A–F)

### A — Top bar

- Left: “Allegheny College · Computer & Information Science” in small mono.
- Right: the term in a bold ivory/gold pill.
  - Document Engineering: **Spring 2027** (gold pill).
  - Theoretical Machines: **Fall 2025** (ivory text, orchid border).
- The term must remain the most visible text in the bar.

### B — Hero

Document Engineering:

- Kicker: `CMPSC 104` pill, **Spring 2027** in bold plum, “A Prosegrammers
  course.”
- Title: “DOCUMENT” / “ENGINEERING,” `63pt` Bricolage Grotesque, `line-height:
  0.82`, `letter-spacing: -0.05em`.
- Tagline: “Where *prose* meets *programming*.”
- Intro: 5 balanced lines, ending with the career-readiness sentence.
- Badges (5): 4 credits, HE + SP, Project-based, Hands-on, Applied learning.
- Art: plum arch, astronaut, orbit, stars, gold “NO PREREQUISITE” sticker.

Theoretical Machines:

- Kicker: `CMPSC 204` pill, **Fall 2025** in bold ink, “A Proofgrammers
  course.”
- Title: “THEORETICAL” / “MACHINES,” `56pt` Space Grotesk, `line-height: 0.86`,
  `letter-spacing: -0.04em`.
- Tagline: “Where *proofs* meet *Python*.”
- Intro: 5 balanced lines stressing theory applied through Python and
  career-ready skills for software engineers and data scientists.
- Badges (5): 4 credits, QR + SP, Prereq: CMPSC 102, Theory + Python, Applied.
- Art: graph-paper aubergine arch, cream paper circle, circuit-board elephant,
  Turing tape, “CS CORE” sticker, “P vs NP?” and “Q.E.D.” stamps.

### C — Pipeline

Dark band with 4 steps and inline SVG icons/arrows.

Document Engineering:

1. Write — Markdown + Python
2. Version — Git + GitHub
3. Build — Quarto + RevealJS
4. Publish — Web + PDF

Theoretical Machines (mauve band):

1. Model — Machines & automata
2. Prove — Reductions & complexity
3. Code — Python + uv
4. Verify — Tests & experiments

### D — Learn

- Header: “What you’ll learn” plus the section note.
- 3 cards, each with a module tag, heading, promise line, 4 bullets, and a
  bottom code/critique line.
- A one-line “also” note under the cards.

Document Engineering:

- Note: **3 modules · 12 demos · 3 projects**.
- Cards: Foundations, Building Blocks, Advanced.
- Bottom lines: Critique uv & Quarto; ruff & Django; ty & FastAPI.
- Also line: Diataxis, README-driven dev, localization, Zettelkasten, digital
  gardens, NLP, regex, search, RAG.

Theoretical Machines:

- Note: **3 modules · 14 chapters · 3 executable exams**.
- Cards: Machines & Limits, Universality, Complexity & NP.
- Bottom lines: Code a Turing machine; a reduction; a complexity lab.
- Also line: *What Can Be Computed?* (MacCormick), Jupyter, Quarto,
  Git/GitHub, charettes, team presentations.

### E — Toolkit

Lavender band, two rows of six chips; the 3 AI tools use the dark `chip hot`
style with a bright dot.

Document Engineering:

- Row 1: Python, VS Code, Git, GitHub, Quarto, Markdown
- Row 2: RevealJS, FastAPI, Django, GitHub Copilot, Pi Coding Agent, OpenCode

Theoretical Machines:

- Row 1: Python, Jupyter, Quarto, VS Code, Git, GitHub
- Row 2: uv, Markdown, RevealJS, GitHub Copilot, Pi Coding Agent, OpenCode

### F — Footer

Document Engineering:

- **Spring 2027** · Main Campus
- January 19 — May 11, 2027
- Class: T/Th, 9:30 – 10:45 AM, Alden Hall, 109 Lecture
- Lab: Tuesday, 2:30 – 4:00 PM, Alden Hall, 109 Lab
- Quick facts: project-based · team presentations · portfolio
- Instructor: Dr. Gregory M. Kapfhammer
- QR to prosegrammers.com; “Become one of the” + light wordmark.

Theoretical Machines:

- **Fall 2025** · Main Campus
- August 26 — December 5, 2025
- Class: T/Th, 9:30 – 10:45 AM, Alden Hall, 109
- Lab: Tuesday, 2:30 – 4:00 PM, Alden Hall, 109
- Final: Monday, December 8, 2025, 7:00 – 9:00 PM, Alden Hall, 109
- Quick facts: CS core · theory + Python · applied proofs
- **No instructor name:** the owner is not teaching the next offering; use the
  department line unless a new instructor is confirmed.
- QR to proofgrammers.com; “Become one of the” + cream wordmark tile.

## Design system

### Shared

- Body: Inter.
- Labels / code / tape: Ubuntu Mono (400 and 700).
- Paper: warm off-white (`#f9f7fb` for Document Engineering, `#fdf8fc` for
  Theoretical Machines).
- Format: US Letter portrait; vector PDF + 300 DPI PNG.
- Structure: blocks A–F, full-bleed dark footer, 0.42in side margins.

### Document Engineering

| Token | Value | Use |
| --- | --- | --- |
| Plum | `#371a45` | Primary brand, dark bands |
| Plum deep | `#2b1136` | Pipeline band |
| Violet | `#7a4e99` | Secondary headlines |
| Paper | `#f9f7fb` | Page background |
| Blue | `#00aaff` | Highlights, links |
| Gold | `#ffc857` | Stickers, rules |

- Display: Bricolage Grotesque (800 for headlines, 500 for the tagline).
- Hero title: `63pt`.
- Cards: blue / gold / violet accents.
- Sticker: gold “NO PREREQUISITE” circle.

### Theoretical Machines

| Token | Value | Use |
| --- | --- | --- |
| Ink | `#3b1b52` | Primary dark, footer, arch |
| Ink deep | `#2a1136` | Deep shadow |
| Mauve | `#7e5186` | Pipeline band, secondary text |
| Orchid | `#c85a9e` | Accents, tape head, rules |
| Orchid deep | `#a33b7e` | Title line 2, small accent text |
| Paper | `#fdf8fc` | Page background |
| Lavender | `#efe2f4` | Toolkit band |
| Ivory | `#f4e6b8` | Stamps, sticker, highlights |
| Ivory ink | `#8a6716` | Gold text on cream |

- Display: Space Grotesk (700 for headlines, 500 for the tagline).
- Hero title: `56pt`.
- Cards: orchid / mauve / dark gold accents.
- Sticker: ivory “CS CORE” circle.
- Artwork: circuit-board elephant on a graph-paper circle; Turing tape.

### Shape and detail

- Cards: `0.10in` radius, 1px line border, `0.055in` accent top bar.
- Badges: pill radius, uppercase mono, one solid dark badge for “4 credits.”
- Footer: gold/orchid top rule, full bleed, QR in a cream tile.
- Keep display faces course-specific; do not recolor one poster with another
  course’s palette.

## Copy rules

- Use numerals for counts: **3 modules**, **12 demos**, **14 chapters**,
  **3 executable exams**.
- Use “**Become one of the Prosegrammers**” / “**Become one of the
  Proofgrammers**” with the plural wordmark.
- Keep the term bold in the top bar, hero kicker, and footer.
- No emojis. Decorative icons are SVG or the course artwork.
- Spell the department as “Computer and Information Science” in running text;
  the top bar may use “Computer & Information Science” for space.
- The AI tool list is GitHub Copilot, Pi Coding Agent, OpenCode. Gemini CLI is
  deprecated.

Document Engineering copy must also:

- State **no prerequisite** clearly.
- Keep the intro’s career-readiness sentence and 5 balanced lines.
- Use “3 modules · 12 demos · 3 projects.”
- Include the real-world doc critiques (uv, Quarto, ruff, Django, ty, FastAPI).
- Name Dr. Gregory M. Kapfhammer as instructor.

Theoretical Machines copy must also:

- Stress that the course is **theoretical but applied**: Python, executable
  proofs, experiments, and practical skills for software engineers and data
  scientists.
- Keep the intro’s career-readiness sentence and 5 balanced lines.
- Use “3 modules · 14 chapters · 3 executable exams.”
- Include the textbook *What Can Be Computed?* by John MacCormick.
- Do **not** name Dr. Gregory M. Kapfhammer as instructor; he is not teaching
  the next offering. Use the department line unless a new instructor is
  confirmed.
- Treat the Fall 2025 dates/times as the last edition’s schedule. If the poster
  is reused for a later offering, update the term, dates, final exam, and
  instructor.

## Course facts

### Document Engineering — Spring 2027

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

### Theoretical Machines — Fall 2025 (last edition)

- Course: **CMPSC 204 — Theoretical Machines**
- Brand: **Proofgrammers**
- Department: Computer and Information Science, Allegheny College
- Term: Fall 2025, Main Campus
- Dates: August 26 — December 5, 2025
- Class: T/Th, 9:30 – 10:45 AM, Alden Hall, 109
- Lab: Tuesday, 2:30 – 4:00 PM, Alden Hall, 109
- Final executable exam: Monday, December 8, 2025, 7:00 – 9:00 PM,
  Alden Hall, 109
- Instructor: **intentionally omitted**; the owner is not teaching the next
  offering. Use the department line unless a new instructor is confirmed.
- Credits: 4
- Prerequisite: CMPSC 102 or permission of instructor
- Distribution: QR + SP
- Textbook: *What Can Be Computed? A Practical Guide to the Theory of
  Computation* by John MacCormick
- 3 modules, 14 chapters, 3 executable exams
- Module 1: computability, computer programs, impossible Python programs,
  computational problems, Turing machines
- Module 2: universal programs, reductions, nondeterminism, finite automata
- Module 3: complexity theory, Poly vs Expo, PolyCheck & NPoly, polynomial-time
  reductions, NP-completeness
- Format: charettes, proofgrammer presentations, in-person knowledge checks,
  interim and final executable exams, Python programs with `uv`
- Tools: Python, Jupyter, Quarto, VS Code, Git, GitHub, uv, Markdown, RevealJS,
  GitHub Copilot, Pi Coding Agent, OpenCode
- Course site: <https://proofgrammers.com/>
- Syllabus: <https://proofgrammers.com/syllabus/>

## Assets and QR codes

Document Engineering:

- `assets/astronaut.svg` — astronaut extracted from the course logo.
- `assets/wordmark-light.svg` — cream wordmark for the dark footer.
- `assets/wordmark.svg` and `assets/prosegrammers-logo.svg` — reference artwork.
- QR: `assets/qr-prosegrammers.svg` / `.png`, pointing to
  `https://prosegrammers.com/`.

Theoretical Machines:

- `assets/elephant.png` — circuit-board elephant cropped from the course logo.
- `assets/wordmark.png` — Proofgrammers wordmark cropped from the course logo.
- `assets/proofgrammers-logo.png` — original reference artwork.
- QR: `assets/qr-proofgrammers.svg` / `.png`, pointing to
  `https://proofgrammers.com/`.
- The wordmark is purple with a light shadow; place it on a **cream tile**, not
  directly on the dark footer.

QR codes are generated with Segno at error correction level H, with a 2-module
quiet zone. To regenerate, use the appropriate URL and filenames:

```bash
cd proofgrammers
uv run --with segno python - <<'PY'
import segno

qr = segno.make("https://proofgrammers.com/", error="h")
qr.save("assets/qr-proofgrammers.svg", kind="svg", scale=1, border=2,
        dark="#3b1b52", light="#fdf8fc")
qr.save("assets/qr-proofgrammers.png", kind="png", scale=12, border=2,
        dark="#3b1b52", light="#fdf8fc")
PY
```

For Document Engineering, change the URL to `https://prosegrammers.com/`, the
filenames to `qr-prosegrammers.*`, and the dark/light colors to `#371a45` /
`#f9f7fb`.

Do not remove the quiet zone (`border=2`) or the cream padding around the QR
tile. After changing a QR, decode it from the rendered poster — not just the
standalone asset.

## QA checklist

Run the build, then check:

- [ ] `preview.png` shows the entire page; no clipped text, cards, or footer.
- [ ] The term is bold and easy to find in the top bar, hero kicker, and footer.
- [ ] The intro is 5 balanced lines and does not touch the sticker.
- [ ] All 5 badges fit on one row.
- [ ] 3 cards, 4 bullets each, bottom code/critique lines visible, no overflow.
- [ ] Toolkit has 2 rows and includes GitHub Copilot, Pi Coding Agent, OpenCode.
- [ ] CTA says “Become one of the” above the plural wordmark.
- [ ] Footer schedule, dates, rooms, and (where applicable) final exam are
      correct.
- [ ] PDF: 1 page, `612 × 792 pt` (US Letter).
- [ ] PNG: `2550 × 3300` at 300 DPI.
- [ ] QR decodes to the correct course URL.
- [ ] Fonts are embedded; no missing-glyph boxes.
- [ ] `git status` contains only intended changes; `build/` is not staged.

Poster-specific checks:

- Document Engineering: gold “NO PREREQUISITE” sticker; HE + SP; no-prereq
  claim; Dr. Gregory M. Kapfhammer as instructor; `3 modules · 12 demos ·
  3 projects`.
- Theoretical Machines: elephant, paper circle, Turing tape, “CS CORE”
  sticker, “P vs NP?” and “Q.E.D.” stamps; `3 modules · 14 chapters ·
  3 executable exams`; final exam row; **no instructor name**; QR to
  proofgrammers.com.

Useful checks:

```bash
pdfinfo document-engineering/CMPSC104-Document-Engineering-Spring2027.pdf \
  | grep -E 'Pages|Page size'
pdfinfo proofgrammers/CMPSC204-Theoretical-Machines-Fall2025.pdf \
  | grep -E 'Pages|Page size'

python3 - <<'PY'
from PIL import Image
for path in [
    "document-engineering/CMPSC104-Document-Engineering-Spring2027.png",
    "proofgrammers/CMPSC204-Theoretical-Machines-Fall2025.png",
]:
    im = Image.open(path)
    print(path, im.size, im.info.get("dpi"))
PY

pdffonts proofgrammers/CMPSC204-Theoretical-Machines-Fall2025.pdf
```

To verify a QR in the rendered poster, crop its area and decode it with
OpenCV (`uv run --with opencv-python-headless --with pillow`). It should return
the course URL.

## Adding a new course poster

1. Read this file and an existing course README.
2. Copy a reference folder:

   ```bash
   cp -r document-engineering new-course-name
   # or: cp -r proofgrammers new-course-name
   ```

3. Rename the PDF/PNG to the new course and term.
4. Choose a display face and palette that fit the course; keep Inter,
   Ubuntu Mono, US Letter, and the A–F structure.
5. Update `poster.html`:
   - blocks A–F content
   - title, course code, term, schedule, instructor
   - module cards, toolkit, CTA
   - artwork and QR
6. Update the course `README.md` and the root `README.md` table.
7. Run `./new-course-name/build.sh`.
8. Work through the QA checklist.
9. Commit the source, assets, final PDF, PNG, and preview.

If a course has its own mascot or wordmark, extract/crop it cleanly, place it on
a light panel if it is dark, and document the asset in the course README.

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
  - `Add Theoretical Machines Fall 2025 poster`
  - `Update Document Engineering poster copy and badges`
- Do not commit `build/`.
- Push to `main` after committing.
- Keep the root README table, each course README, and this file in sync.

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
- **Purple wordmark on a dark footer:** use the cream wordmark tile; the
  Proofgrammers wordmark is dark purple and needs a light backing.
- **Elephant/astronaut looks cut off:** these are cropped PNG/SVG assets with
  transparent padding; adjust `width`/`position`, not the source pixels.
- **Chromium PDF fonts:** Chromium may embed variable display fonts as Type 3
  fonts. They print correctly; the 300 DPI PNG is the raster fallback.
- **Theoretical Machines term/date drift:** the poster intentionally uses the
  last edition’s Fall 2025 schedule. Update it when the next offering is known;
  do not add the owner as instructor.
