---
layout: section
---

# 自分で作る: bind -x

シェル関数を、そのまま編集操作にする

---

## bind -x は「変数を書き換える関数」をキーに割り当てる

<div class="mt-8">

| 変数 | 中身 |
|---|---|
| `READLINE_LINE` | 入力中のコマンドライン全体 |
| `READLINE_POINT` | カーソル位置(先頭が0) |
| `READLINE_MARK` | マークの位置(bash 5.1 から) |

</div>

<div class="mt-6 text-lg">

- キーを押すと関数が呼ばれ、関数の中ではこの変数に今の行が入っている
- 関数が変数を書き換えると、終わったときにその内容が行に反映される

</div>

<KeyMessage v-click>

  変数を書き換えるだけで、コマンドラインが変わる！！

</KeyMessage>

---
clicks: 2
---

## 例: 行頭に sudo を付ける

<div class="mt-4 grid grid-cols-[3fr_2fr] gap-8 items-start">

<SudoWidgetFlow :stage="$clicks" />

<div class="steps">

- <kbd>Ctrl</kbd> + <kbd>a</kbd> で行頭に戻って `sudo ` を打ち、<kbd>Ctrl</kbd> + <kbd>e</kbd> で行末に戻る
- …の3手が <kbd>Alt</kbd> + <kbd>s</kbd> の1手になる

</div>

</div>

---

## 作り方: 関数を書いて bind -x で割り当てる

<AnnotatedCode class="mt-10" style="--slidev-code-font-size: 16px">

```bash
# ~/.bashrc(bind -x は bash の機能なので ~/.inputrc には書けない)
_prepend_sudo() {
  READLINE_LINE="sudo $READLINE_LINE"
  READLINE_POINT=$((READLINE_POINT + 5))
}
bind -x '"\es": _prepend_sudo'
```

<CodeRegion v-click :line="3" text='"sudo $READLINE_LINE"' label="行の先頭に sudo を足す" />
<CodeRegion v-click :line="4" text="READLINE_POINT + 5" label="足した5文字ぶんカーソルをずらす" color="#16a34a" label-position="below" />
<CodeRegion v-click :line="6" text="bind -x" label="シェル関数を割り当てる" color="#9333ea" label-position="below" />

</AnnotatedCode>

<KeyMessage v-click>

  関数を書いて、割り当てる。たったこれだけ！！

</KeyMessage>

<!--
カーソルをずらさないと、sudo の5文字ぶん左にカーソルが残る。
\es は Alt + s。bash 5.2 の既定では割り当てがないキーなので、上書きの心配がない。
-->

---

## 実例: fzf の C-t も bind -x でできている

<div class="mt-4 text-lg">

- fzf の <kbd>Ctrl</kbd> + <kbd>t</kbd> は、選んだファイル名をカーソル位置の `READLINE_LINE` に差し込んでいる
- 仕組みが分かれば、自分用の検索や挿入も同じ形で作れる

</div>

<div class="mt-4">

```bash
# fzf の shell/key-bindings.bash から抜粋
fzf-file-widget() {
  local selected="$(__fzf_select__ "$@")"
  READLINE_LINE="${READLINE_LINE:0:READLINE_POINT}$selected${READLINE_LINE:READLINE_POINT}"
  READLINE_POINT=$((READLINE_POINT + ${#selected}))
}
bind -m emacs-standard -x '"\C-t": fzf-file-widget'
```

</div>

<KeyMessage v-click>

  有名なツールも、同じ仕組みの上に作られている！！

</KeyMessage>

<Ref>

<carbon-logo-github /> [junegunn/fzf: shell/key-bindings.bash](https://github.com/junegunn/fzf/blob/master/shell/key-bindings.bash)

</Ref>
