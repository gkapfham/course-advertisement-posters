# Fonts

The poster uses local font files so it renders identically offline and in print.
Nothing is fetched from a remote host at build time.

| Font | Use | License | Source |
| --- | --- | --- | --- |
| Archivo | Display / headlines, wordmark | SIL Open Font License 1.1 | <https://fonts.google.com/specimen/Archivo> |
| Inter | Body copy | SIL Open Font License 1.1 | <https://fonts.google.com/specimen/Inter> |
| Ubuntu Mono | Labels, schedule, code, chips | Ubuntu Font Licence 1.0 | <https://fonts.google.com/specimen/Ubuntu+Mono> |

- `archivo-latin.woff2` is the Latin subset of the Archivo variable font
  (weights 400–900), downloaded from Google Fonts.
- `inter-latin.woff2` and `ubuntu-mono-400/700.woff2` are the Latin subsets
  already used by the other posters in this repository.
- `archivo.css` is the Google Fonts stylesheet kept as a reference for the
  download; the poster itself only loads the local `.woff2` files.

License texts:

- SIL Open Font License 1.1 — <https://openfontlicense.org/>
- Ubuntu Font Licence 1.0 — <https://www.ubuntu.com/legal/font-licence>
