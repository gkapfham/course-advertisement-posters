# Fonts

The poster uses local font files so it renders identically offline and in print.
Each file is the Latin subset downloaded from Google Fonts; no network access is
needed at build time.

| Font | Use | License | Source |
| --- | --- | --- | --- |
| Archivo | Display / headlines, course title, card headings, schedule names | SIL Open Font License 1.1 | <https://fonts.google.com/specimen/Archivo> |
| Inter | Body copy, intro, bullets, CTA line | SIL Open Font License 1.1 | <https://fonts.google.com/specimen/Inter> |
| Ubuntu Mono | Labels, code, terminal, badges, quick facts | Ubuntu Font Licence 1.0 | <https://fonts.google.com/specimen/Ubuntu+Mono> |

Files:

- `archivo-latin.woff2` — Archivo variable, weight range 400–900, Latin subset.
- `inter-latin.woff2` — Inter variable, weight range 100–900, Latin subset.
- `ubuntu-mono-400.woff2`, `ubuntu-mono-700.woff2` — Ubuntu Mono regular and bold.
- `archivo.css` — the original Google Fonts stylesheet, kept as a reference for
  the remote URLs and `unicode-range` values.

## Licenses

- **SIL Open Font License 1.1** — Archivo and Inter may be used, bundled, and
  redistributed (including inside PDFs) provided the license accompanies the
  fonts and the fonts are not sold on their own.
  <https://openfontlicense.org/open-font-license-official-text/>
- **Ubuntu Font Licence 1.0** — Ubuntu Mono may be used, bundled, and
  redistributed under the terms of the Ubuntu Font Licence.
  <https://ubuntu.com/legal/font-licence>

## Subset caveat

Only the Latin subset is bundled. Characters outside it render from a fallback
font and appear as an extra embedded font in the PDF. Keep labels, code, and
terminal copy to Latin-1 plus the punctuation the subset covers (`·`, `–`, `—`,
`’`, `•`, `«`, `»`); avoid arrows such as `→` (U+2192), which are not in the
Ubuntu Mono Latin subset.
