#!/usr/bin/env bash
# Build the US Letter poster as PDF and 300 DPI PNG.
# Requires: chromium-browser (or chromium / google-chrome) and pdftoppm.
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p build

BROWSER=""
for candidate in chromium-browser chromium google-chrome google-chrome-stable; do
  if command -v "$candidate" >/dev/null 2>&1; then BROWSER="$candidate"; break; fi
done
if [ -z "$BROWSER" ]; then
  echo "No Chromium/Chrome found. Install one or render poster.html with your browser's Print dialog." >&2
  exit 1
fi

echo "→ Rendering PDF with $BROWSER"
"$BROWSER" \
  --headless=new \
  --disable-gpu \
  --no-sandbox \
  --no-pdf-header-footer \
  --print-to-pdf-no-header \
  --run-all-compositor-stages-before-draw \
  --virtual-time-budget=8000 \
  --print-to-pdf="build/poster.pdf" \
  "file://$(pwd)/poster.html" 2>/dev/null

echo "→ Rasterizing at 300 DPI"
rm -f build/poster-*.png build/poster.png
pdftoppm -png -r 300 -singlefile "build/poster.pdf" "build/poster"

# A smaller preview for quick sharing / chat
pdftoppm -png -r 110 -singlefile "build/poster.pdf" "build/poster-preview"

# Friendly, descriptive copies at the course folder root
cp build/poster.pdf "CMPSC203-Developer-Development-Fall2026.pdf"
cp build/poster.png "CMPSC203-Developer-Development-Fall2026.png"
cp build/poster-preview.png "preview.png"

echo "✓ build/poster.pdf"
echo "✓ build/poster.png"
echo "✓ build/poster-preview.png"
echo "✓ CMPSC203-Developer-Development-Fall2026.pdf"
echo "✓ CMPSC203-Developer-Development-Fall2026.png"
echo "✓ preview.png"
