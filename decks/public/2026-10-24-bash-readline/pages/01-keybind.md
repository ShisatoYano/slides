---
layout: section
---

# 既定のキーバインドで手数を減らす

設定ゼロ、今日から使える

---

## キーの読み方: C- は Ctrl、M- は Alt

<div class="mt-8">

| 表記 | 押し方 | 例 |
|---|---|---|
| `C-a` | <kbd>Ctrl</kbd> + <kbd>a</kbd> | 行頭へ移動 |
| `M-f` | <kbd>Alt</kbd> + <kbd>f</kbd>(または <kbd>Esc</kbd> を押して離してから <kbd>f</kbd>) | 1単語右へ移動 |
| `C-x C-e` | <kbd>Ctrl</kbd> + <kbd>x</kbd> のあとに <kbd>Ctrl</kbd> + <kbd>e</kbd> | エディタで編集 |

</div>

- `M` は Meta キー。<kbd>Alt</kbd> で効かないときは、ターミナルの「Alt を Meta として送る」設定を確かめる
- `man bash` もこの表記で書かれている

<KeyMessage v-click>

  この表記が読めれば、マニュアルからキーを拾える！！

</KeyMessage>

---

## まずは移動と削除

<div class="mt-6 grid grid-cols-2 gap-10">

<div>

| キー | 動き |
|---|---|
| `C-a` / `C-e` | 行頭 / 行末へ |
| `M-b` / `M-f` | 1単語左 / 右へ |
| `C-l` | 画面をクリア |
| `C-r` | 履歴を検索 |

</div>

<div>

| キー | 動き |
|---|---|
| `C-w` | カーソルの左の1単語を削除 |
| `C-u` | カーソルより左を削除 |
| `C-k` | カーソルより右を削除 |
| `C-y` | 削除したものを貼り付け |

</div>

</div>

<div v-click class="mt-8 text-center text-lg">
  このキーバインド、どこかで見たことあるような…？
</div>

<KeyMessage v-click>

  Emacs と同じキーバインド！(<code>set -o vi</code> で Vi 風にもできる)

</KeyMessage>

---

## M-. : 直前のコマンドの最後の引数を入れる

<div class="mt-6 grid grid-cols-[2fr_3fr] gap-8 items-start">

<div class="steps">

- 作ったディレクトリにそのまま入りたい
- `cd` まで打って <kbd>Alt</kbd> + <kbd>.</kbd>
- 長いパスを打ち直さずに済む

</div>

<TerminalWindow title="bash">
  <div class="term-line"><span class="term-prompt">$</span>mkdir -p ~/work/2026/bash-slides</div>
  <div class="term-line"><span class="term-prompt">$</span>cd <span class="term-cursor" /></div>
  <div class="term-key">↓ Alt + .</div>
  <div class="term-line"><span class="term-prompt">$</span>cd <span class="term-hl">~/work/2026/bash-slides</span><span class="term-cursor" /></div>
</TerminalWindow>

</div>

<KeyMessage v-click>

  直前に打ったものは、もう一度打たなくていい！！

</KeyMessage>

---

## M-. の続き: もっと前の引数も取り出せる

<div class="mt-6 grid grid-cols-[3fr_2fr] gap-6 items-start">

<div>

| 押し方 | 入るもの |
|---|---|
| <kbd>Alt</kbd> + <kbd>.</kbd> を続けて押す | さらに前のコマンドの最後の引数 |
| <kbd>Alt</kbd> + <kbd>2</kbd> → <kbd>Alt</kbd> + <kbd>.</kbd> | 直前のコマンドの2番目の単語(コマンド名が0番目) |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>y</kbd> | 直前のコマンドの最初の引数 |

</div>

<TerminalWindow title="bash">
  <div class="term-line"><span class="term-prompt">$</span>cp config.yml config.yml.bak</div>
  <div class="term-line"><span class="term-prompt">$</span>vim <span class="term-cursor" /></div>
  <div class="term-key">↓ Ctrl + Alt + y</div>
  <div class="term-line"><span class="term-prompt">$</span>vim <span class="term-hl">config.yml</span><span class="term-cursor" /></div>
</TerminalWindow>

</div>

<KeyMessage v-click>

  最後じゃない引数も、数字を添えれば取り出せる！！

</KeyMessage>

---

## C-_ : 直前の編集を取り消す

<div class="mt-6 grid grid-cols-[2fr_3fr] gap-8 items-start">

<div class="steps">

- `C-w` で消しすぎた
- <kbd>Ctrl</kbd> + <kbd>_</kbd> で1つ前に戻る
- `C-x C-u` も同じ undo
- `M-r` なら行をまるごと元に戻す

</div>

<TerminalWindow title="bash">
  <div class="term-line"><span class="term-prompt">$</span>rsync -av ./dist/ server:/var/www/<span class="term-cursor" /></div>
  <div class="term-key">↓ Ctrl + w(手が滑って1単語消した)</div>
  <div class="term-line"><span class="term-prompt">$</span>rsync -av ./dist/ <span class="term-cursor" /></div>
  <div class="term-key">↓ Ctrl + _</div>
  <div class="term-line"><span class="term-prompt">$</span>rsync -av ./dist/ <span class="term-hl">server:/var/www/</span><span class="term-cursor" /></div>
</TerminalWindow>

</div>

<KeyMessage v-click>

  消しすぎても、打ち直さずに取り消せる！！

</KeyMessage>

<!--
C-_ は Ctrl + Shift + - で押す。多くのターミナルでは Ctrl + / でも同じキーコードが送られる。
-->

---

## C-u → C-y : 書きかけの行を退避する

<div class="mt-6 grid grid-cols-[2fr_3fr] gap-8 items-start">

<div class="steps">

- コミットしかけて、add 忘れに気づいた
- `C-u` で行を消して(退避して)
- 先に `git add` を実行
- `C-y` で書きかけが戻る

</div>

<TerminalWindow title="bash">
  <div class="term-line"><span class="term-prompt">$</span>git commit -m "Fix typo in README"<span class="term-cursor" /></div>
  <div class="term-key">↓ Ctrl + u</div>
  <div class="term-line"><span class="term-prompt">$</span>git add README.md</div>
  <div class="term-line"><span class="term-prompt">$</span><span class="term-cursor" /></div>
  <div class="term-key">↓ Ctrl + y</div>
  <div class="term-line"><span class="term-prompt">$</span><span class="term-hl">git commit -m "Fix typo in README"</span><span class="term-cursor" /></div>
</TerminalWindow>

</div>

<KeyMessage v-click>

  消した行はキルリングに残っている。退避場所として使える！！

</KeyMessage>

<!--
別の手として M-# は、行の先頭に # を付けて履歴に残す(実行はされない)。あとで ↑ で呼び戻して # を消して使う。
-->

---

## C-x C-e : いつものエディタで編集する

<div class="mt-6 grid grid-cols-[2fr_3fr] gap-8 items-start">

<div class="steps">

- 長いワンライナーを直したい
- <kbd>Ctrl</kbd> + <kbd>x</kbd> <kbd>Ctrl</kbd> + <kbd>e</kbd> で `$VISUAL`(なければ `$EDITOR`)が開く
- 保存して閉じると**そのまま実行される**
- やめたいときは、Vim なら `:cq` で終了

</div>

<TerminalWindow title="bash">
  <div class="term-line"><span class="term-prompt">$</span>for f in *.log; do gzip "$f"; done<span class="term-cursor" /></div>
  <div class="term-key">↓ Ctrl + x  Ctrl + e</div>
  <div class="term-line term-dim">  1 for f in *.log; do</div>
  <div class="term-line term-dim">  2   gzip "$f"</div>
  <div class="term-line term-dim">  3 done</div>
  <div class="term-line term-dim">~</div>
  <div class="term-line term-dim">/tmp/bash-fc.Xk3a  [+]          :wq</div>
</TerminalWindow>

</div>

<KeyMessage v-click>

  bash は最初から割り当て済み。エディタの操作がそのまま使える！！

</KeyMessage>

<!--
zsh は edit-command-line を自分で割り当てる必要があり、閉じると行に戻る。bash は閉じると実行まで進む。
エディタが0以外で終わると実行されない(VISUAL=false で確認済み)。
-->

---

## C-r : 履歴をインクリメンタル検索する

<div class="mt-6 grid grid-cols-[2fr_3fr] gap-8 items-start">

<div class="steps">

- 打った文字を含む履歴が出る
- もう一度 `C-r` で、さらに古い候補へ
- `Enter` で実行、`C-e` などで編集に戻る
- `C-s` で新しい方へ戻れる…が、効かないことが多い

</div>

<TerminalWindow title="bash">
  <div class="term-line"><span class="term-dim">(reverse-i-search)`</span>ssh<span class="term-dim">': </span><span class="term-hl">ssh</span> -L 8080:localhost:80 dev-server</div>
</TerminalWindow>

</div>

<v-click>

<Callout label="C-s が効かないとき" class="mt-6">
  ターミナルのフロー制御(画面の一時停止)が <code>C-s</code> を先に取っている。<code>~/.bashrc</code> に <code>stty -ixon</code> を書くと Readline に届く
</Callout>

</v-click>
