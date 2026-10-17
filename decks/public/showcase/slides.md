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
transition: slide-left
mdc: true
layout: cover
---

# Slidev部品ショーケース

自作アドオン `slidev-addon-yano` と、Slidev標準機能の使い方カタログ

<!--
新しい部品や記法はまずここで試し、使い方の見本として残す。題材はブックマーク・タブ整理の発表から借りる。
-->

---

# Magic Move: コードが育つ様子を見せる

````md magic-move {lines: true}
```bash
# まずはタブの一覧を出す
tabctl list
```

```bash
# fzfで閉じたいタブを選ぶ(Tabで複数選択)
tabctl list | fzf --multi
```

```bash
# 選んだタブをbukuに保存
tabctl list | fzf --multi |
while IFS=$'\t' read -r id title url; do
  buku --nostdin -a "$url" tab-archive --title "$title"
done
```

```bash
# 保存したタブを閉じる
tabctl list | fzf --multi |
while IFS=$'\t' read -r id title url; do
  buku --nostdin -a "$url" tab-archive --title "$title"
  tabctl close "$id"
done
```
````

<!--
使う場面: 前の段階との差分を見せたいとき。1段ごとに変える行は1〜2行に抑えると目で追える。
書き方: ````md magic-move で囲み、段階ごとにコードブロックを並べる。{lines: true} で行番号を出す。
-->

---

# 行ハイライト: 完成したコードを説明順に追う

```bash {2|3-6|7-8|all}
tabarchive() {
  tabctl list | fzf --multi |
  while IFS=$'\t' read -r id title url; do
    # タグを付けてbukuに保存
    buku --nostdin -a "$url" tab-archive \
      --title "$title"
    # 保存したタブを閉じる
    tabctl close "$id"
  done
}
```

<!--
使う場面: コードは変えずに、読む順番だけを誘導したいとき。
書き方: 言語名の後ろに {2|3-6|7-8|all}。| で区切った1つが1クリック分。最後に all で全体へ戻す。
-->

---

# v-mark: 文中の一語を手書き風に強調する

- bukuは <span v-mark.underline.orange="1">ローカルのDB</span> でブックマークを管理する
- タグで分類するので <span v-mark.box.red="2">フォルダ分けが要らない</span>
- 保存から <span v-mark.circle.blue="3">タブを閉じる</span> までをコマンド1つにまとめる

<style>
/* v-markの枠は文字の外側に描かれるため、項目の間を空けて隣の行と重ならないようにする */
li {
  margin-block: 1rem;
}
</style>

<!--
使う場面: 文の中の一語に視線を集めたいとき。文字色を変える強調より目立ち、増やしすぎると効かなくなるので1スライド3つまで。
枠や丸は文字の外側に描かれ、隣の行に重なりやすい。箇条書きならスライド内の <style> で li の margin を広げる。
書き方: v-mark.<形>.<色>="<クリック番号>"。形は underline / box / circle / highlight / strike-through など。
-->

---

# kbd: キー操作をキーの形で書く

| 操作 | キー |
|---|---|
| fzfで候補を複数選択 | <kbd>Tab</kbd> |
| 選択を確定 | <kbd>Enter</kbd> |
| fzfを抜ける | <kbd>Esc</kbd> / <kbd>Ctrl</kbd> + <kbd>C</kbd> |

<!--
使う場面: 押すキーを伝えるとき。`Tab` のようにコード扱いにするとコマンド名と区別がつかない。
同時押しは <kbd> を + でつなぐ。
-->

---

# KeyMessage: スライドの結論を一文で置く

- bukuでブックマークをターミナルから管理する
- タグとfzfで、大量のブックマークからでもすぐ探せる

<KeyMessage v-click>これで検索に手こずる心配なし！</KeyMessage>

<!--
使う場面: そのスライドで一番伝えたい一文。1スライドに1つまで。
書き方: <KeyMessage v-click>一文</KeyMessage>。下部中央に固定されるので、本文が下まで伸びるスライドでは重なりに注意する。
-->

---

# Callout: 自己紹介に「今日のゴール」を添える

<div class="grid grid-cols-[auto_1fr] gap-10 items-center mt-8">
  <img src="./images/icon.jpeg" class="w-40 h-40 rounded-full" />
  <div>
    <div class="text-2xl font-black">Shisato Yano</div>
    <div class="mt-2 text-gray-600">車や船の自動運転システムを作るソフトウェアエンジニア</div>
  </div>
</div>

<Callout label="今日のゴール" class="mt-10">
  ブックマークとタブを、ターミナルからコマンド1つで片付けられるようになる
</Callout>

<!--
使う場面: LTで「今日伝えたいこと」に1枚を割けないとき、自己紹介と同じスライドに置く。15分以上の発表なら独立したスライドにしてよい。
書き方: <Callout label="ラベル">本文</Callout>
-->

---

# Ref: 出典を左下に添える

- bukuはローカルのSQLiteにブックマークを保存する
- タグ付け・検索・インポート/エクスポートをCLIから行える

<Ref>

[jarun/buku](https://github.com/jarun/buku) / [buku の README](https://github.com/jarun/buku#readme)

</Ref>

<!--
使う場面: 引用・他者の画像・ツールの説明を載せたスライド。書籍ならページ番号、写真ならライセンスも書く。
書き方: <Ref> と </Ref> の内側を空行で挟むと、中のMarkdown(リンクなど)が解釈される。
-->
