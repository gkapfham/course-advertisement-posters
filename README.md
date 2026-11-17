# Course Advertisement Posters

Print-ready promotional posters for courses in the **Department of Computer and
Information Science at Allegheny College**.

Each poster is a self-contained HTML/CSS document rendered to a US Letter PDF
and a 300 DPI PNG. The HTML is the editable source; the PDF and PNG are
committed so a poster can be printed or shared immediately.

![CMPSC 104 — Document Engineering, Spring 2027](document-engineering/preview.png)

## Posters

| Course | Term | Deliverables | Source |
| --- | --- | --- | --- |
| **CMPSC 104 — Document Engineering** | Spring 2027 | [PDF](document-engineering/CMPSC104-Document-Engineering-Spring2027.pdf) · [PNG](document-engineering/CMPSC104-Document-Engineering-Spring2027.png) | [document-engineering/](document-engineering/) |

## Repository layout

```text
course-advertisement-posters/
├── README.md
├── .gitignore
└── document-engineering/
    ├── README.md
    ├── poster.html
    ├── build.sh
    ├── CMPSC104-Document-Engineering-Spring2027.pdf
    ├── CMPSC104-Document-Engineering-Spring2027.png
    ├── preview.png
    └── assets/
        ├── astronaut.svg
        ├── prosegrammers-logo.svg
        ├── wordmark.svg
        ├── wordmark-light.svg
        ├── qr-prosegrammers.svg
        ├── qr-prosegrammers.png
        └── fonts/
```

Every course gets its own top-level directory. Keep the poster source, artwork,
fonts, build script, final PDF/PNG, and a small preview together so the poster
remains reproducible.

## Design system

The posters share a small, reusable visual language:

| Token | Value | Use |
| --- | --- | --- |
| Plum | `#371a45` | Primary brand color, dark bands |
| Violet | `#7a4e99` | Secondary headlines, accents |
| Paper | `#f9f7fb` | Page background |
| Blue | `#00aaff` | Highlights, links, small accents |
| Gold | `#ffc857` | Stickers, rules, callouts |

- **Display:** Bricolage Grotesque
- **Body:** Inter
- **Labels / code:** Ubuntu Mono
- **Format:** US Letter portrait, 8.5 × 11 in
- **Outputs:** vector PDF + 300 DPI PNG (2550 × 3300 px)

Fonts are stored locally in each poster’s `assets/fonts/` directory so builds
are reproducible offline. See the font notes in the course folder for licenses.

## Building a poster

Each course folder has its own `build.sh`:

```bash
./document-engineering/build.sh
```

The script uses headless Chromium and `pdftoppm`. It writes intermediates to
`build/` (ignored by git) and copies the final PDF, PNG, and preview to the
course folder root.

## Adding a new poster

1. Copy an existing course folder as a starting point:

   ```bash
   cp -r document-engineering new-course-name
   ```

2. Rename the PDF and PNG to match the new course and term.
3. Edit `poster.html`; the copy is grouped into blocks **A–F** with comments.
4. Replace the artwork in `assets/` as needed.
5. Update the course `README.md` and the poster table above.
6. Run `./new-course-name/build.sh` and check the PDF/PNG.
7. Commit the source, assets, final PDF, final PNG, and preview.

## Assets and licensing

- The poster fonts are open-source: Bricolage Grotesque and Inter under the SIL
  Open Font License 1.1, and Ubuntu Mono under the Ubuntu Font Licence 1.0.
  License links live in `document-engineering/assets/fonts/README.md`.
- The astronaut and Prosegrammers wordmark are course branding taken from the
  Prosegrammers course logo.
- QR codes are generated with [Segno](https://segno.readthedocs.io/).
- No repository-wide license has been added yet; add one before accepting
  outside reuse.
