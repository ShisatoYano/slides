---
theme: default
title: Slidev部品ショーケース
# 日本語がGoogle Fonts側の欧文フォントにフォールバックして崩れないよう、和文フォントを明示する
fonts:
  sans: Noto Sans JP
  serif: Noto Serif JP
  mono: JetBrains Mono
  weights: '400,700,900'
# Slidevはデッキのフォルダの「親」を起点に解決するため、../ は2つで ~/slides に届く
addons:
  - ../../addons/slidev-addon-yano
# 先読みはビルドで名前が変わる前の画像パスを使い404になるだけなので止める
preloadImages: false
transition: slide-left
mdc: true
layout: cover
# 表紙の見出しも # なので、外さないと目次の先頭に並ぶ
hideInToc: true
---

# Slidev部品ショーケース

自作アドオン `slidev-addon-yano` と、Slidev標準機能の使い方カタログ

<!--
新しい部品や記法はまずここで試し、使い方の見本として残す。題材はブックマーク・タブ整理の発表から借りる。
各スライドのノートには書き方と注意点だけを書く。いつ何を使うかは ~/slides/CLAUDE.md の「表現の使い分け」に書く。
-->

---

## 目次

<Toc maxDepth="1" />

---
src: ./pages/01-standard.md
---

---
src: ./pages/02-components.md
---

---
src: ./pages/03-structure.md
---
