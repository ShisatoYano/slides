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
