---
layout: section
---

# 仕組み: キーは Readline の関数につながっている

調べて、付け替える

---

## bash の行編集は Readline が担当している

<div class="mt-16 flex items-center justify-center text-center">
  <div class="node">押したキー<br><code>M-.</code></div>
  <div v-click class="flex items-center">
    <div class="edge"><code>Readline</code><span>対応を探す</span></div>
    <div class="node">関数<br><code>yank-last-arg</code></div>
  </div>
  <div v-click class="flex items-center">
    <div class="edge"><code>実行</code><span>行を書き換える</span></div>
    <div class="node is-goal">入力中の<br>コマンドライン</div>
  </div>
</div>

<div v-click class="mt-10 text-center text-lg">
  関数は全部で173個。そのうち88個は、最初はどのキーにも割り当てられていない(bash 5.2)
</div>

<KeyMessage v-click>

  キーと関数の対応表を書き換えれば、bash の操作感は変えられる！！

</KeyMessage>

<style>
.node {
  width: 9.5rem;
  padding: 0.9rem 0.5rem;
  border: 2px solid #d1d5db;
  border-radius: 0.6rem;
  font-weight: 700;
  line-height: 1.6;
}

.node.is-goal {
  border-color: var(--yano-accent);
  color: var(--yano-accent);
}

/* 矢印の上に担当、下に役割を置く */
.edge {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 7rem;
  font-size: 0.8rem;
}

.edge::after {
  content: '→';
  order: 1;
  font-size: 1.5rem;
  line-height: 1;
  color: var(--yano-muted);
}

.edge code {
  order: 0;
  font-weight: 700;
  color: var(--yano-accent);
}

.edge span {
  order: 2;
  color: var(--yano-muted);
}
</style>

---

## 対応表を調べる: bind

```bash {1-2|4-5|7-8|10-11|all}
# 今の割り当てを全部出す
bind -p

# あるキーに何が割り当てられているか
bind -p | grep '"\\e\."'

# ある関数がどのキーで呼べるか
bind -q undo

# まだ割り当てのない関数を探す(新しい操作の引き出しになる)
bind -p | grep 'not bound'
```

<KeyMessage v-click>

  知らない操作は、<code>bind -p</code> の中から見つかる！！

</KeyMessage>

<!--
bind -p の出力は "\e." のように \e(Esc = Meta)で書かれる。grep するときはバックスラッシュとドットのエスケープに注意。
-->

---

## 対応表を書き換える: ~/.inputrc

```bash {1-2|4-5|7-8|all}
# 置くとシステムの /etc/inputrc が読まれなくなるので、先に読み込む
$include /etc/inputrc

# "キー": 関数名 で割り当てる
"\C-xs": shell-expand-line

# set 変数名 値 で動きを変える
set completion-ignore-case on
```

<div class="mt-6 text-lg">

- 書いたら <kbd>Ctrl</kbd> + <kbd>x</kbd> <kbd>Ctrl</kbd> + <kbd>r</kbd> でその場で読み直せる
- Readline を使うほかのツール(`gdb`、`psql` など)にも同じ設定が効く

</div>

<KeyMessage v-click>

  <code>~/.inputrc</code> に書けば、次のシェルからも同じ操作感になる！！

</KeyMessage>

---

## おすすめの ~/.inputrc

```bash {2-4|5-8|9-12|all}
$include /etc/inputrc
# ↑↓ を「打ちかけた内容で始まる履歴」の検索にする
"\e[A": history-search-backward
"\e[B": history-search-forward
# Space を押した時点で !! や !$ を展開して見せる
$if Bash
  Space: magic-space
$endif
# 補完で大文字小文字を区別しない / 候補を1回の Tab で出す / 種類で色分けする
set completion-ignore-case on
set show-all-if-ambiguous on
set colored-stats on
```

<KeyMessage v-click>

  数行足すだけで、履歴と補完がぐっと楽になる！！

</KeyMessage>

---

## ↑ で前方一致の履歴検索

<div class="mt-6 grid grid-cols-[2fr_3fr] gap-8 items-start">

<div class="steps">

- `git` まで打って <kbd>↑</kbd>
- `git` で始まる履歴だけをさかのぼる
- カーソルは打ったところに残る
- 何も打たずに <kbd>↑</kbd> なら今までどおり

</div>

<TerminalWindow title="bash">
  <div class="term-line term-dim">$ git log --oneline -5</div>
  <div class="term-line term-dim">$ ls -la</div>
  <div class="term-line term-dim">$ git push origin main</div>
  <div class="term-line term-dim">$ make test</div>
  <div class="term-line"><span class="term-prompt">$</span>git<span class="term-cursor" /></div>
  <div class="term-key">↓ ↑</div>
  <div class="term-line"><span class="term-prompt">$</span>git<span class="term-hl"> push origin main</span></div>
  <div class="term-key">↓ ↑(ls は飛ばす)</div>
  <div class="term-line"><span class="term-prompt">$</span>git<span class="term-hl"> log --oneline -5</span></div>
</TerminalWindow>

</div>

<KeyMessage v-click>

  <code>C-r</code> を開くまでもない検索は ↑ で済む！！

</KeyMessage>
