---
# 登壇時の動機メモ(未登壇):
# - zsh/fish を勧められがちだが、今使っている bash 自体をまだ使いこなせていない
# - ROS開発など、何らかの事情で bash を使い続ける人向けにしたい
#   ROS 2 には setup.zsh もあるので「ROSだからbash必須」とは言わない。
#   「公式手順やチームのスクリプトが bash 前提」「実機・コンテナ・SSH先は素のbash」と言う
#   一番の理由は「チーム全体が Ubuntu + bash なので、揃えると手順書やスクリプト、ペア作業がそのまま通じる」
# 登壇が決まったら: 例のコマンドをROS寄り(ros2 launch / colcon build 等)に、1章を「設定ゼロで実機でも効く」と強調、
#   締めに「~/.inputrc は1ファイルで持ち込みやすい」を添える
theme: default
title: 素のbashでも手数は減らせる
# 既定の '%s - Slidev' だとタブ名にツール名が付く
titleTemplate: '%s'
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
layout: none
# 表紙の見出しも # なので、外さないと目次の先頭に並ぶ
hideInToc: true
---

<div class="relative px-14 pt-12">
  <div class="mt-24">
    <h1 class="!text-5xl !font-black !leading-tight text-[var(--yano-accent)]">素のbashでも手数は減らせる</h1>
    <div class="mt-5 text-xl font-bold text-gray-500">Readline・bind・shopt で、思いどおりに動くシェルにする</div>
  </div>
</div>

---

## 今日伝えたいこと

<div class="mt-10 text-xl leading-loose">

<v-clicks>

- zsh や fish に乗り換えないと、シェルは快適にならない？
- bash の行編集は **Readline** というライブラリが担っていて、実は機能がかなり多い
- キーを覚える → 仕組みを知る → 自分で作る、の3段で手数を減らす

</v-clicks>

</div>

<KeyMessage v-click>

  乗り換えなくても、素のbashで手数は減らせる！！

</KeyMessage>

<Ref>

構成は mozumasu「[zsh から学ぶ最高の UX](https://partner-prop.github.io/slides/mozumasu/terminal-night-3/)」(Terminal Night 3)を参考にした

</Ref>

---

## 目次

<Toc maxDepth="1" />

---
src: ./pages/01-keybind.md
---

---
src: ./pages/02-readline.md
---

---
src: ./pages/03-bind-x.md
---

---
src: ./pages/04-shopt.md
---

---

## まとめ

<v-clicks>

<div class="summary">
  <div class="summary-verb">覚える</div>
  <div><kbd>Alt</kbd> + <kbd>.</kbd>、<kbd>Ctrl</kbd> + <kbd>_</kbd>、<kbd>Ctrl</kbd> + <kbd>x</kbd> <kbd>Ctrl</kbd> + <kbd>e</kbd> は設定なしで今日から使える</div>
</div>

<div class="summary">
  <div class="summary-verb">知る</div>
  <div>キーは Readline の関数につながっている。<code>bind -p</code> で調べ、<code>~/.inputrc</code> で付け替える</div>
</div>

<div class="summary">
  <div class="summary-verb">作る</div>
  <div><code>bind -x</code> なら、<code>READLINE_LINE</code> を書き換える関数がそのまま編集操作になる</div>
</div>

</v-clicks>

<KeyMessage v-click>

  乗り換えなくても、素のbashで手数は減らせる！！

</KeyMessage>

---

## まずはこれだけ試してみてほしい

<div class="mt-6 grid grid-cols-2 gap-8 items-start">

<div class="text-lg">

1. 次にディレクトリを作ったら、`cd` のあとで <kbd>Alt</kbd> + <kbd>.</kbd>
2. 長いコマンドを直すときは <kbd>Ctrl</kbd> + <kbd>x</kbd> <kbd>Ctrl</kbd> + <kbd>e</kbd>
3. `~/.inputrc` に右の4行を書いて、<kbd>↑</kbd> を前方一致の履歴検索にする

</div>

```bash
# ~/.inputrc
$include /etc/inputrc
"\e[A": history-search-backward
"\e[B": history-search-forward
set completion-ignore-case on
```

</div>

<Ref>

[Bash Reference Manual: Command Line Editing](https://www.gnu.org/software/bash/manual/html_node/Command-Line-Editing.html) / `man bash` の READLINE の節

</Ref>
