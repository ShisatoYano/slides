#!/bin/sh
# デッキを配布用のPDFにして export/<デッキ名>.pdf に置く。--notes でスピーカーノートも別PDFにする。
# 依存の解決がリポジトリ直下で通るため、必ずリポジトリ直下で実行する
#   例: sh scripts/export-pdf.sh decks/private/2026-11-01-xxx --notes
set -eu

usage() {
  echo "Usage: $0 <deck-dir> [--notes]" >&2
  exit 1
}

[ $# -ge 1 ] || usage
dir=${1%/}
notes=false
case ${2:-} in
  --notes) notes=true ;;
  "") ;;
  *) usage ;;
esac

if [ ! -f "$dir/slides.md" ]; then
  echo "Error: $dir/slides.md がない" >&2
  exit 1
fi

deck=$(basename "$dir")
out="$PWD/export"
mkdir -p "$out"

# --with-clicks は付けない。クリックごとにほぼ同じページが並び、読むだけの人には冗長になるため
npx slidev export "$dir/slides.md" --with-toc --output "$out/$deck.pdf"

if [ "$notes" = true ]; then
  npx slidev export-notes "$dir/slides.md" --output "$out/$deck-notes.pdf"
fi

echo "Exported: $out/$deck.pdf"
