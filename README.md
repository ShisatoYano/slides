# slides

オープンイベントでの発表資料置き場([Slidev](https://sli.dev/))。
headmatterに `publish: true` を書いたデッキは、`main` へのpushで [GitHub Pages](https://shisatoyano.github.io/slides/) にも公開される。

## PDFに書き出す

リポジトリ直下で実行すると `export/<デッキ名>.pdf` ができる。`--notes` を付けるとスピーカーノートも `export/<デッキ名>-notes.pdf` に書き出す。

```bash
sh scripts/export-pdf.sh decks/public/2026-10-15-terminal-bookmark-tab
sh scripts/export-pdf.sh decks/public/2026-10-15-terminal-bookmark-tab --notes
```

## 発表資料一覧

| 日付 | イベント | タイトル | 資料 | Web |
|---|---|---|---|---|
| 2026-10-15 | [Terminal Night 3](https://kichijojipm.connpass.com/event/404746/) | ブックマーク・タブを減らせない人にすすめたい, ターミナル+CLIによる整理整頓術 | [slides.md](decks/public/2026-10-15-terminal-bookmark-tab/slides.md) | [開く](https://shisatoyano.github.io/slides/2026-10-15-terminal-bookmark-tab/) |
