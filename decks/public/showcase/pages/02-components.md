---
layout: section
---

# 自作アドオンの部品

`addons/slidev-addon-yano/components/`

---

## 配色: 部品の色はCSS変数で指定する

<div class="mt-6 text-sm font-bold">デッキ全体の配色</div>
<div class="mt-2 grid grid-cols-2 gap-4">
  <div class="flex items-center gap-3">
    <span class="w-8 h-8 rounded border border-gray-300" style="background: var(--yano-accent)" />
    <div><code>--yano-accent</code><div class="text-xs opacity-70">見出し・枠・ラベル</div></div>
  </div>
  <div class="flex items-center gap-3">
    <span class="w-8 h-8 rounded border border-gray-300" style="background: var(--yano-accent-soft)" />
    <div><code>--yano-accent-soft</code><div class="text-xs opacity-70">囲み枠の背景</div></div>
  </div>
  <div class="flex items-center gap-3">
    <span class="w-8 h-8 rounded border border-gray-300" style="background: var(--yano-emphasis)" />
    <div><code>--yano-emphasis</code><div class="text-xs opacity-70">結論の強調</div></div>
  </div>
  <div class="flex items-center gap-3">
    <span class="w-8 h-8 rounded border border-gray-300" style="background: var(--yano-muted)" />
    <div><code>--yano-muted</code><div class="text-xs opacity-70">補足の文字</div></div>
  </div>
</div>

<div class="mt-8 text-sm font-bold">ターミナルの配色</div>
<div class="mt-2 grid grid-cols-2 gap-x-4 gap-y-2">
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-bg)" /><code class="text-xs">--yano-term-bg</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-bar)" /><code class="text-xs">--yano-term-bar</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-fg)" /><code class="text-xs">--yano-term-fg</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-dim)" /><code class="text-xs">--yano-term-dim</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-green)" /><code class="text-xs">--yano-term-green</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-blue)" /><code class="text-xs">--yano-term-blue</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-red)" /><code class="text-xs">--yano-term-red</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-term-yellow)" /><code class="text-xs">--yano-term-yellow</code></div>
  <div class="flex items-center gap-2"><span class="w-6 h-6 rounded border border-gray-300" style="background: var(--yano-code-bg)" /><code class="text-xs">--yano-code-bg</code></div>
</div>

<!--
書き方: 部品の中で color: var(--yano-accent) のように使う。定義は addons/slidev-addon-yano/styles/index.css。
注意: ダークモード(d キー)の値は同じファイルの html.dark に書く。部品側で dark 用のセレクタを書くときは :global() を使わず html.dark .xxx と書く(:global() だとVueがセレクタ全体をグローバルにする)。
-->

---

## KeyMessage: スライドの結論を一文で置く

- bukuでブックマークをターミナルから管理する
- タグとfzfで、大量のブックマークからでもすぐ探せる

<KeyMessage v-click>これで検索に手こずる心配なし！</KeyMessage>

<!--
書き方: <KeyMessage v-click>一文</KeyMessage>
注意: 下部中央に固定されるので、本文が下まで伸びるスライドでは重なる。
-->

---

## Callout: 自己紹介に「今日のゴール」を添える

<div class="grid grid-cols-[auto_1fr] gap-10 items-center mt-8">
  <img src="../images/icon.jpeg" class="w-40 h-40 rounded-full" />
  <div>
    <div class="text-2xl font-black">Shisato Yano</div>
    <div class="mt-2 text-gray-600 dark:text-gray-400">車や船の自動運転システムを作るソフトウェアエンジニア</div>
  </div>
</div>

<Callout label="今日のゴール" class="mt-10">
  ブックマークとタブを、ターミナルからコマンド1つで片付けられるようになる
</Callout>

<!--
書き方: <Callout label="ラベル">本文</Callout>。label は文字列としてそのまま表示される(Markdownは効かない)。
-->

---

## Ref: 出典を左下に添える

- bukuはローカルのSQLiteにブックマークを保存する
- タグ付け・検索・インポート/エクスポートをCLIから行える

<Ref>

[jarun/buku](https://github.com/jarun/buku) / [buku の README](https://github.com/jarun/buku#readme)

</Ref>

<!--
書き方: <Ref> と </Ref> の内側を空行で挟むと、中のMarkdown(リンクなど)が解釈される。
-->

---

## AnnotatedCode / CodeRegion: コードの一部に注釈を付ける

<AnnotatedCode class="mt-12">

```bash
tabctl list | fzf --multi |
while IFS=$'\t' read -r id title url; do
  buku --nostdin -a "$url" tab-archive --title "$title"
  tabctl close "$id"
done
```

<CodeRegion v-click :line="1" text="fzf --multi" label="Tabで複数選択" />
<CodeRegion v-click :line="3" text="tab-archive" label="付けるタグ" color="#ef4444" />
<CodeRegion v-click :line="3" text='--title "$title"' label="タブのタイトルをそのまま使う" color="#16a34a" label-position="below" />
<CodeRegion v-click :line="4" text='tabctl close "$id"' label="保存したタブを閉じる" color="#9333ea" label-position="below" />

</AnnotatedCode>

<!--
書き方: <AnnotatedCode> の内側を空行で挟み、コードブロックの後に <CodeRegion :line="行番号" text="探す文字列" label="ラベル" /> を並べる。
同じ行に同じ文字列が複数あるときは :occurrence="2" で何個目かを指定する。
コードを大きく見せたいときは <AnnotatedCode style="--slidev-code-font-size: 16px"> のように指定する(行間は文字サイズの3倍で追従する)。
注意: text に " を含むときは属性を ' で囲む。上のラベルが上の行に重なるなら label-position="below" にする。見つからないと枠は出ず、コンソールに警告が出る。
-->

---
clicks: 4
---

## データで動く図: クリックに合わせて状態を進める

<TabArchiveFlow :stage="$clicks" />

<!--
作り方:
1. frontmatter に clicks: <段階の数> を書き、部品に :stage="$clicks" を渡す
2. 部品側は「何番目の段階で何が起きるか」を定数とデータで持ち、stage との比較だけで見た目を切り替える
3. 動きは CSS の transition に任せる(幅を縮める・色を変える・不透明度を変える)
-->
