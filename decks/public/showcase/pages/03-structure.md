---
layout: section
---

# 資料の構成

章扉・目次・章ごとのファイル分割

---

## 章扉: layout: section

```md
---
layout: section
---

# 章のタイトル

章の説明を一行で
```

- 見た目はアドオンの `layouts/section.vue` が標準テーマの同名レイアウトを上書きしている
- 15分以上の発表で、章の変わり目に置く(LTでは使わない)

---

## 目次: Toc

```md
## 目次

<Toc maxDepth="1" />
```

- 各スライドの最初の見出しから、目次を自動で作る
- 章扉だけを `#`、通常のスライドを `##` にして、`maxDepth="1"` で章だけを並べる
- 表紙も `#` なので、表紙のfrontmatterに `hideInToc: true` を書いて外す

---

## 章ごとのファイル分割: src

```md
---
src: ./pages/01-standard.md
---
```

- `slides.md` には表紙・目次・まとめなど骨組みだけを置き、章の中身は `pages/` に分ける
- 分けたファイルの中の画像は、そのファイルからの相対パス(`../images/...`)で書く

<KeyMessage>15分以上の発表は、章扉 + 目次 + ファイル分割をセットで使う</KeyMessage>
