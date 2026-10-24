---
layout: section
---

# 設定で底上げする: shopt と履歴

キーを押さなくても効く設定

---

## shopt: 既定でオフの便利機能をオンにする

<div class="mt-6">

| オプション | 効果 | 例 |
|---|---|---|
| `autocd` | ディレクトリ名だけで移動する | `..` → `cd ..` |
| `cdspell` | `cd` の打ち間違いを直して移動する | `cd /ect` → `/etc` |
| `dirspell` | 補完のときにディレクトリ名の打ち間違いを直す | `ls /usr/lcoal/<Tab>` |
| `globstar` | `**` で下の階層まで再帰的にマッチする | `ls **/*.md` |

</div>

```bash
# ~/.bashrc
shopt -s autocd cdspell dirspell globstar
```

<KeyMessage v-click>

  <code>shopt -s</code> の1行で、打つ量も打ち間違いも減る！！

</KeyMessage>

<!--
shopt だけ打つと今の設定の一覧が出る。Ubuntu の /etc/skel/.bashrc では globstar がコメントアウトされて入っている。
-->

---

## 履歴を育てる

```bash {2|3-4|5-7|all}
# ~/.bashrc
HISTCONTROL=ignoreboth        # 空白始まりと、直前と同じコマンドは残さない
HISTSIZE=100000               # シェルが覚えておく件数
HISTFILESIZE=100000           # ~/.bash_history に残す件数
shopt -s histappend           # 閉じたときに上書きせず追記する
# コマンドを打つたびにファイルへ書き出し、ほかのタブにも残るようにする
PROMPT_COMMAND="history -a${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
```

<div class="mt-6 text-lg">

- Ubuntu の既定は `HISTSIZE=1000`。数か月前のコマンドはもう残っていない
- 前の章の ↑ や `C-r` は、**履歴が残っていてこそ**効く

</div>

<KeyMessage v-click>

  履歴が多いほど、↑ と <code>C-r</code> が強くなる！！

</KeyMessage>

<!--
ignoreboth は ignorespace と ignoredups をまとめたもの。パスワードを含むコマンドは先頭に空白を入れて打てば残らない。
history -a は追記だけ。ほかのタブの履歴をすぐ ↑ で使いたいなら history -n で読み込みも要るが、↑ の順番が混ざるので入れていない。
-->
