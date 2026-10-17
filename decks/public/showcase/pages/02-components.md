---
layout: section
---

# 自作アドオンの部品

`addons/slidev-addon-yano/components/`

---

## KeyMessage: スライドの結論を一文で置く

- bukuでブックマークをターミナルから管理する
- タグとfzfで、大量のブックマークからでもすぐ探せる

<KeyMessage v-click>これで検索に手こずる心配なし！</KeyMessage>

<!--
使う場面: そのスライドで一番伝えたい一文。1スライドに1つまで。
書き方: <KeyMessage v-click>一文</KeyMessage>。下部中央に固定されるので、本文が下まで伸びるスライドでは重なりに注意する。
-->

---

## Callout: 自己紹介に「今日のゴール」を添える

<div class="grid grid-cols-[auto_1fr] gap-10 items-center mt-8">
  <img src="../images/icon.jpeg" class="w-40 h-40 rounded-full" />
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

## Ref: 出典を左下に添える

- bukuはローカルのSQLiteにブックマークを保存する
- タグ付け・検索・インポート/エクスポートをCLIから行える

<Ref>

[jarun/buku](https://github.com/jarun/buku) / [buku の README](https://github.com/jarun/buku#readme)

</Ref>

<!--
使う場面: 引用・他者の画像・ツールの説明を載せたスライド。書籍ならページ番号、写真ならライセンスも書く。
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
使う場面: 行の中の引数1つを指したいとき。行全体を指すだけなら標準の行ハイライトで足りる。
書き方: <AnnotatedCode> の内側を空行で挟み、コードブロックの後に <CodeRegion :line="行番号" text="探す文字列" label="ラベル" /> を並べる。
text に " を含むときは属性を ' で囲む。上のラベルが上の行に重なるなら label-position="below" にする。
-->

---
clicks: 4
---

## データで動く図: クリックに合わせて状態を進める

<TabArchiveFlow :stage="$clicks" />

<!--
使う場面: 発表の山場で、操作の流れをスクショの切り替えではなく動きで見せたいとき。手間がかかるので1発表に1〜2枚まで。
作り方:
1. frontmatter に clicks: <段階の数> を書き、部品に :stage="$clicks" を渡す
2. 部品側は「何番目の段階で何が起きるか」を定数とデータで持ち、stage との比較だけで見た目を切り替える
3. 動きは CSS の transition に任せる(幅を縮める・色を変える・不透明度を変える)
ターミナルの枠はアドオンの <TerminalWindow>、図の中身はデッキの components/ に置く。
-->
