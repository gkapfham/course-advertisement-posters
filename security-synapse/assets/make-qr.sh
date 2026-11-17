#!/usr/bin/env bash
# Regenerate the QR code with Segno: error correction H, 2-module quiet zone.
# Colors come from the Security Synapse palette (navy modules on paper).
# Requires: uv (https://docs.astral.sh/uv/)
set -euo pipefail
cd "$(dirname "$0")/.."

uv run --quiet --with segno --with pillow python - <<'PY'
import segno

qr = segno.make("https://www.securitysynapse.org/", error="h", micro=False)
qr.save(
    "assets/qr-securitysynapse.svg",
    scale=10,
    border=2,
    dark="#14294a",
    light="#fdfdff",
    xmldecl=False,
    svgns=True,
)
qr.save(
    "assets/qr-securitysynapse.png",
    scale=24,
    border=2,
    dark="#14294a",
    light="#fdfdff",
    dpi=300,
)
print("QR version", qr.version, "error", qr.error, "→", qr.designator)
PY
