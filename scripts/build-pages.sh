#!/bin/sh
# decks/public/ のデッキをすべてビルドし、GitHub Pages に置く dist/ を作る。
# 依存の解決がリポジトリ直下で通るため、必ずリポジトリ直下で実行する
set -eu

base_path=${BASE_PATH:-/slides}
out="$PWD/dist"

rm -rf "$out"
mkdir -p "$out"

escape_html() {
  sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g'
}

# 日付始まりのデッキを新しい順に並べ、日付のないデッキ(showcase等)はその後ろに置く
decks=$(
  ls -d decks/public/*/ | sed 's|/$||' | grep '/[0-9]' | sort -r
  ls -d decks/public/*/ | sed 's|/$||' | grep -v '/[0-9]' | sort
)

items=""
for dir in $decks; do
  [ -f "$dir/slides.md" ] || continue
  deck=$(basename "$dir")

  # GitHub Pagesはどのパスでもアプリ本体を返す設定ができず、/<デッキ>/5 を直接開くと404になるため hash モードにする
  npx slidev build "$dir/slides.md" --base "$base_path/$deck/" --router-mode hash --out "$out/$deck"

  title=$(sed -n '2,/^---$/s/^title: *//p' "$dir/slides.md" | head -n 1 | escape_html)
  items="$items    <li><a href=\"./$deck/\">${title:-$deck}</a><span>$deck</span></li>
"
done

cat > "$out/index.html" <<HTML
<!doctype html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Shisato Yano の発表資料</title>
  <style>
    body { max-width: 48rem; margin: 3rem auto; padding: 0 1rem; font-family: system-ui, sans-serif; color: #111827; }
    h1 { color: #0369a1; }
    li { margin: 0.75rem 0; }
    li span { margin-left: 0.75rem; font-size: 0.85rem; color: #6b7280; }
    a { color: #0369a1; }
  </style>
</head>
<body>
  <h1>発表資料</h1>
  <ul>
$items  </ul>
  <p><a href="https://github.com/ShisatoYano/slides">ソース (GitHub)</a></p>
</body>
</html>
HTML

echo "Built: $out"
