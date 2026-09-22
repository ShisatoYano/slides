# slides

Slidevで作る発表資料の置き場。

## 構成

```
~/slides/
├── decks/
│   ├── public/<日付>-<スラッグ>/slides.md   ← 公開してよい資料(Git管理下)
│   └── private/<日付>-<スラッグ>/slides.md  ← 業務資料(Git管理外)
├── .githooks/pre-commit   ← 業務資料の混入を弾く
├── package.json   → ~/dotfiles/slidev/package.json    (リンク)
└── node_modules   → ~/dotfiles/slidev/node_modules    (リンク)
```

Slidev本体・テーマ・playwright(書き出し用Chromium)は`~/dotfiles/slidev`に1セットだけ入っている。
デッキを増やしても`npm install`は不要。

## コマンド

| コマンド | 動作 |
|---|---|
| `slidenew <タイトル>` | 業務資料として`decks/private/`に作成し、nvimで開く |
| `slidenew --public <タイトル>` | 公開資料として`decks/public/`に作成する |
| `slidedev` | デッキを選んで開発サーバ起動(ブラウザが開く) |
| `slideexport` | デッキと形式(pdf/pptx/png)を選んで書き出し |

記法の早見表は`~/dotfiles/docs/slidev-cheatsheet.md`(nvimで`<leader>sh`)。

## 公開範囲の扱い

このリポジトリは**public**。業務情報を含む資料が公開されないよう、二重に止めている。

1. `.gitignore`が`decks/*`で全デッキを除外し、`!decks/public/`だけを戻す。
   除外リストに書き足す方式ではなく**公開するものだけを明示する方式**にしてあるので、
   置き場所を間違えたデッキはコミットされない
2. `.githooks/pre-commit`が、`decks/public/`以外のデッキがステージされたコミットを拒否する

フックは`core.hooksPath`で有効化してある。clone直後は設定が入らないので、別マシンで使うときは
`git config core.hooksPath .githooks`を実行すること。

## 注意

- **依存を足すときは`~/dotfiles/slidev`で`npm install <パッケージ>`する**。`~/slides`側で実行すると、
  リンクしてある`package.json`が実ファイルに置き換わってdotfilesの管理から外れる
- **`.gitignore`をdotfilesへのシンボリックリンクにしてはいけない**。Git 2.28以降は
  `.gitignore`/`.gitattributes`/`.mailmap`がシンボリックリンクだと読み込みを拒否するため、
  無視ルールが一切効かなくなる(`warning: unable to access '.gitignore'`が出る)
- Slidev 53はNode 22.12以上が必要。`node -v`が古い場合はターミナルを開き直す(nvmのdefaultはLTS)
