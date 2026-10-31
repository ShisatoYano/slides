---
theme: default
title: 無ければ作ろう！理想の技術書籍を作るOSSプロジェクト
# 既定の '%s - Slidev' だとタブ名やSNSのカードのタイトルにツール名が付く
titleTemplate: '%s'
# GitHub Pages に公開する(scripts/build-pages.sh が見る)
publish: true
# SNSのクローラは相対パスの画像を解決しないため絶対URLで書く。auto はCIにブラウザがなく撮影できないので使わない
# 説明文は info に書くとSlidevが前後に " を付けて出力するため ogDescription に書く
seoMeta:
  ogDescription: 無ければ作ろう！理想の技術書籍を作るOSSプロジェクト(//localboast Tokyo)
  ogImage: https://shisatoyano.github.io/slides/2026-11-05-localboast-tokyo/og-image.png
  ogUrl: https://shisatoyano.github.io/slides/2026-11-05-localboast-tokyo/
  twitterCard: summary_large_image
# 日本語がGoogle Fonts側の欧文フォントにフォールバックして崩れないよう、和文フォントを明示する
fonts:
  sans: Noto Sans JP
  serif: Noto Serif JP
  mono: JetBrains Mono
  weights: '400,700,900'
# ~/slides/addons の自作部品。Slidevはデッキのフォルダの「親」を起点に解決するため、../ は2つで ~/slides に届く
addons:
  - ../../addons/slidev-addon-yano
# 先読みはビルドで名前が変わる前の画像パスを使い404になるだけなので止める
preloadImages: false
transition: slide-left
mdc: true
layout: none
---

<div class="relative px-14 pt-12">

  <div class="mt-14">
    <h1 class="!text-4xl !font-black !leading-tight text-[var(--yano-accent)]">無ければ作ろう！<br>理想の技術書籍を作るOSSプロジェクト</h1>
    <div class="mt-4 text-xl font-bold text-gray-500">Want it or make it! An OSS project for the best tech readings</div>
    <div class="mt-4 text-lg font-bold text-gray-400">//localboast Tokyo 2026.11.05</div>
  </div>

  <div class="absolute left-14 top-[420px] flex items-center gap-5">
    <img src="./images/icon.jpeg" class="w-25 h-25 rounded-full border-4 border-sky-100"/>
    <div>
      <div class="text-xl font-bold">Shisato Yano</div>
      <div class="text-sm text-gray-400">自動運転システムエンジニア / Autonomous driving software engineer</div>
    </div>
  </div>
</div>

---

## 自己紹介 <span class="en">About me</span>

<div class="mt-4 grid grid-cols-2 gap-10 items-start">

<div>
  <div class="flex items-center gap-5">
    <img src="./images/icon.jpeg" class="w-24 h-24 rounded-full border-4 border-sky-100"/>
    <div>
      <div class="text-3xl font-black">Shisato Yano</div>
      <div class="mt-2 flex gap-5 text-sm">
        <a href="https://x.com/4310sy" target="_blank" class="flex items-center gap-1 !text-gray-700 dark:!text-gray-300 !border-none">
          <carbon-logo-x />@4310sy
        </a>
        <a href="https://github.com/ShisatoYano" target="_blank" class="flex items-center gap-1 !text-gray-700 dark:!text-gray-300 !border-none">
          <carbon-logo-github />ShisatoYano
        </a>
      </div>
    </div>
  </div>
  <div class="mt-5 text-base leading-snug text-gray-600 dark:text-gray-300">
    自動運転システムを作るソフトウェアエンジニア<br>
    <span class="text-sm text-gray-400">Software engineer building autonomous driving systems</span>
  </div>
</div>

<div>
  <div class="text-base font-bold text-gray-600 dark:text-gray-300">自動運転システムとは？ <span class="text-sm text-gray-400">What's an autonomous system?</span></div>
  <div class="mt-2 grid">
    <img v-click="[1, 2]" src="./images/komatsu_ahs.jpg" class="[grid-area:1/1] w-full h-48 object-cover rounded-lg" />
    <img v-click="2" src="./images/eightknot_vessel.jpg" class="[grid-area:1/1] w-full h-48 object-cover rounded-lg" />
  </div>
  <div class="grid mt-1 text-sm">
    <div v-click="[1, 2]" class="[grid-area:1/1]">でっかいトラックを無人で動かしたり<div class="text-xs text-gray-400">Driving giant trucks with nobody aboard</div></div>
    <div v-click="2" class="[grid-area:1/1]">海の上で船を自律航行させたり<div class="text-xs text-gray-400">Letting boats sail on their own</div></div>
  </div>
</div>

</div>

<Callout v-click="3" label="今日紹介するもの / What I'll introduce" class="mt-4">
  <div class="text-2xl font-black text-[var(--yano-accent)]">自動運転ソフトウェア開発の入門書を作るOSSプロジェクト</div>
  <div class="text-sm text-gray-500 dark:text-gray-400">An OSS project for a beginner's guide to autonomous driving software</div>
</Callout>

<Ref v-click="[1, 2]">

[コマツ ニュースリリース(2026年4月22日)](https://www.komatsu.jp/ja/newsroom/2026/20260422)

</Ref>

<Ref v-click="2">

[エイトノット 公式サイト](https://8kt.jp/)

</Ref>

<!--
25秒。(クリック)鉱山の無人ダンプ → (クリック)小型船の自律航行と、陸でも海でも自動運転を作ってきた → (クリック)今日は、自動運転の入門書をOSSで作っている話をします
-->

---

## 自動運転を学ぶ上でのつらみ <span class="en">The pain of learning autonomous driving</span>

<div class="text-base text-gray-600 dark:text-gray-300">
  <span class="text-3xl font-black text-[var(--yano-emphasis)]">技術の総合格闘技</span> と言われるくらい、必要な知識の幅が広い
  <div class="text-sm text-gray-400">It takes a wide range of tech, like mixed martial arts</div>
</div>

<div class="autonomy">

<AutonomyScene class="mt-1" :play="$clicks >= 1" />

<div class="map mt-4">
  <div v-click="1" class="layer flow">
    <div class="row-label" style="grid-row: 1">要素技術</div>
    <div class="node" style="--i: 0; grid-column: 2 / 8">センシング</div>
    <div class="node" style="--i: 1; grid-column: 8 / 14">自己位置推定</div>
    <div class="node" style="--i: 2; grid-column: 14 / 20">認識</div>
    <div class="node" style="--i: 3; grid-column: 20 / 26">経路計画</div>
    <div class="node" style="--i: 4; --len: 2; grid-column: 26 / 32">制御</div>
  </div>
  <div v-click="2" class="layer base">
    <div class="row-label" style="grid-row: 2">基礎知識</div>
    <div class="node" style="--i: 0; grid-column: 2 / 7">数学</div>
    <div class="node" style="--i: 1; grid-column: 7 / 12">物理学</div>
    <div class="node" style="--i: 2; grid-column: 12 / 17">アルゴリズム</div>
    <div class="node" style="--i: 3; grid-column: 17 / 22">データ構造</div>
    <div class="node" style="--i: 4; grid-column: 22 / 27">ソフト設計</div>
    <div class="node" style="--i: 5; grid-column: 27 / 32">システム<br>アーキテクチャ</div>
  </div>
  <div v-click="3" class="layer">
    <div class="band" style="grid-area: 1 / 2 / 2 / 20"><span class="band-tag">よくある本のカバー範囲</span></div>
    <div class="band" style="grid-area: 2 / 2 / 3 / 22"></div>
    <div class="hole" style="grid-area: 1 / 20 / 2 / 32"></div>
    <div class="hole" style="grid-area: 2 / 22 / 3 / 32"></div>
  </div>
  <div v-click="4" class="gap-note">
    <span class="gap-label">全部を通しで学べる本は見つからなかった <span class="text-xs opacity-80">/ None covered it all</span></span>
  </div>
</div>

</div>

<div v-click="5" class="finale">
  <div class="finale-text">無ければ作ろう！</div>
  <div class="finale-en">Want it or make it!</div>
  <div v-click="6" class="finale-but">…でも、一人じゃ大変 <span class="text-base">/ But it's too much for one person</span></div>
  <div v-click="7" class="finale-text oss">OSSにしてみんなで作ればいい！</div>
  <div v-click="7" class="finale-en">So let's build it together as OSS!</div>
</div>

<style>
/* 場面の各段階と、流れの箱の点灯を同じ時刻で進める */
.autonomy {
  --scene-start: 0.9s;
  --scene-step: 1.2s;
}

/* v-click で見えた瞬間から、--i の順に少しずつずらして出す */
.flow:not(.slidev-vclick-hidden) .node {
  animation:
    pop 0.35s both calc(var(--i) * 0.12s),
    lit calc(var(--scene-step) * var(--len, 1)) calc(var(--scene-start) + var(--i) * var(--scene-step));
}

.base:not(.slidev-vclick-hidden) .node {
  animation: rise 0.4s both;
  animation-delay: calc(var(--i) * 0.12s);
}

/* 本がカバーしていない箱を、赤い点線で囲んで抜けを目立たせる */
.hole {
  margin: -0.25rem;
  border: 3px dashed var(--yano-emphasis);
  border-radius: 0.6rem;
}

.gap-note {
  position: absolute;
  inset: auto 0 -2.5rem;
}

.gap-label {
  position: absolute;
  left: 50%;
  bottom: 0;
  transform: translateX(-50%);
  white-space: nowrap;
  font-size: 1.1rem;
  font-weight: 900;
  color: var(--yano-emphasis);
}

/* 締めの一言は KeyMessage(下部)ではなく、図の上に重ねて中央に大きく出す */
.finale {
  position: absolute;
  inset: 0;
  z-index: 10;
  display: grid;
  place-content: center;
  text-align: center;
  background: color-mix(in srgb, var(--yano-accent-soft) 95%, transparent);
}

.finale:not(.slidev-vclick-hidden) .finale-text:first-child {
  animation: pop 0.4s both;
}

.finale-text {
  font-size: 3.25rem;
  font-weight: 900;
  line-height: 1.2;
  color: var(--yano-emphasis);
}

.finale-en {
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--yano-muted);
}

.finale-but {
  margin-top: 1.5rem;
  font-size: 1.75rem;
  font-weight: 700;
  color: var(--yano-muted);
}

.finale-text.oss {
  margin-top: 0.75rem;
}

.finale-text.oss:not(.slidev-vclick-hidden) {
  animation: pop 0.4s both;
}

@keyframes lit {
  15%, 85% { background: var(--yano-accent); color: white; }
}

@keyframes pop {
  from { opacity: 0; transform: scale(0.6); }
  to { opacity: 1; transform: scale(1); }
}

@keyframes rise {
  from { opacity: 0; transform: translateY(1rem); }
  to { opacity: 1; transform: translateY(0); }
}
</style>

<!--
60秒。自動運転は「技術の総合格闘技」と言われるくらい、知識の幅が広い。自分も新卒で配属されたとき、講習で学べたのは理論までで、残りは本・記事・サンプルコードの寄せ集めだった
→ (クリック)アニメーションが自動で流れる。センサで周りを見て、自分の位置を推定して、障害物を認識して、よける道を決めて、その道に沿うようにハンドルを切る。それぞれが1つの分野
→ (クリック)しかもその下に、数学、物理学、アルゴリズムとデータ構造、ソフト設計、それを1つにまとめるシステムアーキテクチャといった基礎知識がある
→ (クリック)本はたくさんある。でもよくあるのは、大体はカバーしているけれど、経路計画や制御までは無い、設計やアーキテクチャまでは触れていない、という本
→ (クリック)自分が探した範囲では、全部を通しで学べる本は見つからなかった
→ (クリック)だったら、無ければ作ろう！
→ (クリック)…でも、これを一人で全部書くのは大変
→ (クリック)だったら、OSSにしてみんなで作ればいい
-->

---

## だから作っている <span class="en">So I'm building it</span>

<div class="text-base text-gray-600 dark:text-gray-300">
  自動運転ソフトウェア開発の入門書を、OSSで
  <span class="text-sm text-gray-400">/ A beginner's guide to autonomous driving software, as OSS</span>
</div>

<div class="map map-compact mt-5">
  <div class="layer flow">
    <div class="row-label" style="grid-row: 1">要素技術</div>
    <div class="node" style="grid-column: 2 / 8">センシング</div>
    <div class="node" style="grid-column: 8 / 14">自己位置推定</div>
    <div class="node" style="grid-column: 14 / 20">認識</div>
    <div class="node" style="grid-column: 20 / 26">経路計画</div>
    <div class="node" style="grid-column: 26 / 32">制御</div>
  </div>
  <div class="layer base">
    <div class="row-label" style="grid-row: 2">基礎知識</div>
    <div class="node" style="grid-column: 2 / 7">数学</div>
    <div class="node" style="grid-column: 7 / 12">物理学</div>
    <div class="node" style="grid-column: 12 / 17">アルゴリズム</div>
    <div class="node" style="grid-column: 17 / 22">データ構造</div>
    <div class="node" style="grid-column: 22 / 27">ソフト設計</div>
    <div class="node" style="grid-column: 27 / 32">システム<br>アーキテクチャ</div>
  </div>
  <div v-click="1" class="layer">
    <div class="band ours" style="grid-area: 1 / 2 / 2 / 32"><span class="band-tag">このプロジェクトのカバー範囲</span></div>
    <div class="band ours" style="grid-area: 2 / 2 / 3 / 32"></div>
  </div>
  <div v-click="2" class="layer">
    <div class="wip" style="grid-area: 2 / 27 / 3 / 32"><span class="wip-tag">作成中</span></div>
  </div>
</div>

<div class="mt-5 grid grid-cols-2 gap-6 items-start">

<div v-click="2">
  <div class="text-base font-black text-[var(--yano-accent)]">特徴 <span class="text-xs text-gray-400">Features</span></div>
  <ul class="feature-list">
    <li>要素技術から基礎知識まで、通しで <span class="feature-en">End to end</span></li>
    <li>全部Pythonで動くシミュレーション付き <span class="feature-en">All runnable</span></li>
    <li>部品を差し替えて、走りを比べられる <span class="feature-en">Swap and compare</span></li>
  </ul>
</div>

<Callout v-click="3" label="みんなで作っている / Built together">
  <div class="stats">
    <div><div class="stat-num">1,926</div><div class="stat-label">Stars</div></div>
    <div><div class="stat-num">13人</div><div class="stat-label">コントリビュータ</div></div>
    <div><div class="stat-num">8割</div><div class="stat-label">他の人からのPR(マージ済み)</div></div>
  </div>
</Callout>

</div>

<KeyMessage v-click="4">

  世界中のエンジニアと一緒に、全部入りの入門書を作る <span class="en">Building an all-in-one guide with engineers worldwide</span>

</KeyMessage>

<style>
.map-compact .layer {
  grid-template-rows: 2.4rem 2.4rem;
}

.map-compact .node {
  font-size: 0.95rem;
}

.map-compact .base .node {
  font-size: 0.8rem;
}

.feature-list {
  font-size: 0.95rem;
  font-weight: 700;
  line-height: 1.3;
}

.feature-list li {
  margin-top: 0.3rem;
}

.feature-en {
  font-size: 0.7rem;
  color: var(--yano-muted);
}

.stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0.75rem;
  text-align: center;
}

.stat-num {
  font-size: 1.75rem;
  font-weight: 900;
  color: var(--yano-accent);
}

.stat-label {
  font-size: 0.7rem;
  font-weight: 700;
  color: var(--yano-muted);
}

.band.ours {
  border-color: var(--yano-accent);
  background: color-mix(in srgb, var(--yano-accent) 25%, transparent);
}

.band.ours .band-tag {
  background: var(--yano-accent);
}

/* 進行中の箱は、カバー範囲の上に点線で重ねて「まだ途中」と示す */
.wip {
  position: relative;
  z-index: 2;
  margin: -0.25rem;
  border: 3px dashed var(--yano-accent);
  border-radius: 0.6rem;
}

.wip-tag {
  position: absolute;
  top: -0.8rem;
  right: 0.4rem;
  padding: 0 0.4rem;
  border-radius: 0.25rem;
  background: var(--yano-accent-soft);
  border: 2px solid var(--yano-accent);
  color: var(--yano-accent);
  font-size: 0.75rem;
  font-weight: 900;
}
</style>

<!--
50秒。だから作っている。自動運転ソフトウェア開発の入門書をOSSで
→ (クリック)3枚目で抜けていたところも含めて、要素技術と基礎知識を全部通しでカバーするのが目標。正直に言うと、システムアーキテクチャはまだ作成中で、理論の解説ドキュメントも書いている途中
→ (クリック)特徴は3つ。通しで学べる、全部Pythonで動く、部品を差し替えて比べられる
→ (クリック)OSSにしたことで、世界中のエンジニアの知識が集まってきている。マージされたPRの8割以上(40件中33件)は他の人から。自分の勉強にもなる
→ (クリック)世界中のエンジニアと一緒に、全部入りの入門書を作る
-->

---

## ハンドルの切り方は、1行差し替えるだけで変えられる <span class="en">Swap one line to change how it steers</span>

<div class="mt-4 grid grid-cols-2 gap-6">

<Callout label="Pure Pursuit">
  少し先の道の一点を目指してハンドルを切る
  <div class="text-sm text-gray-500 dark:text-gray-400">Aim at a point a little ahead (like a human driver)</div>
</Callout>

<Callout label="Stanley">
  前輪がコースからずれた分を直す
  <div class="text-sm text-gray-500 dark:text-gray-400">Correct how far the front wheel is off the course</div>
</Callout>

</div>

<div class="mt-4">

````md magic-move
```python
# ハンドルの切り方(制御方式)を作る
controller = PurePursuitController(spec, course)
# 車に持たせて走らせる
vehicle = FourWheelsVehicle(state, spec, controller=controller)
vis.add_object(vehicle)
vis.draw()
```

```python
# ハンドルの切り方(制御方式)を作る
controller = StanleyController(spec, course)
# 車に持たせて走らせる
vehicle = FourWheelsVehicle(state, spec, controller=controller)
vis.add_object(vehicle)
vis.draw()
```
````

</div>

<KeyMessage v-click>

  制御の部品を1行取り替えるだけで、違う走り方を試せる <span class="en">Swap one line and try a different way to drive</span>

</KeyMessage>

<Ref>

シミュレーションのコードから抜粋(変数名は簡略化)

</Ref>

<!--
60秒。Pure Pursuitは人が運転するときと同じで、少し先を見る。Stanleyは足元(前輪)のずれを見る。
「なぜこの作りか」: 車・コース・制御方式を別々の部品にしてあるので、制御方式を取り替えても他は一切変えなくていい。
だから同じ条件で比べられる
-->

---

## 走らせて比べる <span class="en">Run and compare</span>

<div class="mt-2 text-center text-base">
  <span class="font-bold text-red-500">赤い線</span> = 走ってほしいコース、<span class="font-bold">黒い点</span> = 実際に走った跡
  <span class="text-sm text-gray-400">/ Red: the course, Black: where the car actually went</span>
</div>

<div class="mt-3 grid grid-cols-2 gap-8 text-center">

<div>
  <div class="text-lg font-black text-[var(--yano-accent)]">Pure Pursuit</div>
  <div class="grid">
    <img v-click.hide="1" src="./images/pure_pursuit.gif" class="[grid-area:1/1] h-52 mx-auto" />
    <img v-click="1" src="./images/pure_pursuit_zoom.png" class="[grid-area:1/1] h-52 mx-auto object-contain" />
  </div>
  <div v-click="1" class="mt-1 text-sm">急カーブで内側を近道し、抜けたあと外に膨らむ</div>
</div>

<div>
  <div class="text-lg font-black text-[var(--yano-accent)]">Stanley</div>
  <div class="grid">
    <img v-click.hide="1" src="./images/stanley.gif" class="[grid-area:1/1] h-52 mx-auto" />
    <img v-click="1" src="./images/stanley_zoom.png" class="[grid-area:1/1] h-52 mx-auto object-contain" />
  </div>
  <div v-click="1" class="mt-1 text-sm">急カーブでもコースにぴったり沿う</div>
</div>

</div>

<KeyMessage v-click="2">

  同じ車・同じコースでも、ハンドルの切り方で走りが変わる <span class="en">Same car, same course, different driving</span>

</KeyMessage>

<!--
80秒。まずGIFを流して全体を見せ、「右奥の急カーブに注目」と言ってからクリックで拡大図に切り替える。
Pure Pursuitは先の点を目指すので、急カーブでは内側に入り込む。Stanleyは前輪のずれを直し続けるのでコースから離れにくい
-->

---

## まとめ <span class="en">Summary</span>

<v-clicks>

<div class="summary">
  <div class="summary-verb">仕組み</div>
  <div>見る・決める・動かす、の繰り返しで車が自分で走る</div>
</div>

<div class="summary">
  <div class="summary-verb">コード</div>
  <div>認識から制御まで、全分野が動くPythonコードになっている</div>
</div>

<div class="summary">
  <div class="summary-verb">遊び方</div>
  <div>部品を1行取り替えるだけで、走り方の違いを試せる</div>
</div>

</v-clicks>

<KeyMessage v-click>

  コードを動かして遊びながら、自動運転の面白さに触れてみよう <span class="en">Play with the code and discover the fun of autonomous driving</span>

</KeyMessage>

<style>
.summary {
  display: grid;
  grid-template-columns: 7rem 1fr;
  gap: 1rem;
  align-items: center;
  margin-top: 1.5rem;
  font-size: 1.15rem;
}

.summary-verb {
  padding: 0.4rem 0;
  border-radius: 0.5rem;
  background: var(--yano-accent-soft);
  text-align: center;
  font-weight: 900;
  color: var(--yano-accent);
}
</style>

---

## 遊んでみてください <span class="en">Have fun with it</span>

<div class="mt-6 grid grid-cols-[3fr_2fr] gap-8 items-center">

<div>

```bash
git clone https://github.com/ShisatoYano/AutonomousVehicleControlBeginnersGuide
cd AutonomousVehicleControlBeginnersGuide
pip install -r requirements.txt
python src/simulations/path_tracking/stanley_path_tracking/stanley_path_tracking.py
```

<div class="mt-4 text-base leading-loose">

- 将来は書籍にする予定です / Planning to turn it into a book
- フィードバック・Issue・Star 大歓迎！ / Feedback welcome!

</div>

</div>

<div class="flex flex-col items-center gap-3">
  <img src="./images/repo_qr.svg" class="w-36 h-36" />
  <a href="https://github.com/ShisatoYano/AutonomousVehicleControlBeginnersGuide" target="_blank" class="!border-none">
    <img src="./images/repo_card.png" class="w-full rounded-lg shadow-lg" />
  </a>
</div>

</div>

<div class="mt-6 text-center text-xl font-black text-[var(--yano-accent)]">
  ご清聴ありがとうございました / Thank you! <span class="text-base text-gray-400">#localboast_tokyo</span>
</div>
