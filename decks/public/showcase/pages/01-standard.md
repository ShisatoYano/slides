---
layout: section
---

# Slidev標準機能

コードとテキストの見せ方

---

## Magic Move: コードが育つ様子を見せる

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

## 行ハイライト: 完成したコードを説明順に追う

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

## v-mark: 文中の一語を手書き風に強調する

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

## kbd: キー操作をキーの形で書く

| 操作 | キー |
|---|---|
| fzfで候補を複数選択 | <kbd>Tab</kbd> |
| 選択を確定 | <kbd>Enter</kbd> |
| fzfを抜ける | <kbd>Esc</kbd> / <kbd>Ctrl</kbd> + <kbd>C</kbd> |

<!--
使う場面: 押すキーを伝えるとき。`Tab` のようにコード扱いにするとコマンド名と区別がつかない。
同時押しは <kbd> を + でつなぐ。
-->
