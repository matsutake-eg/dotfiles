# dotfiles
開発で使用するツールの設定ファイルまとめです。

# 環境構築手順
作業用PCセットアップ時に必要な手順ついて順番に説明します。  
Mac PCを想定してます。

## Macシステム環境設定
以下の設定を変更しておきます。
- 「キーボード」の「リピート」を最も速く、「リピート入力認識までの時間」を最も短く設定
- 「キーボード」の輝度及び自動調整を無しに設定
- 「キーボード」の「修飾キー」の「Caps Lock」キーを「Ctrl」キーに変更
- 「キーボード」の「ショートカット」の「Launchpadを表示」に「Shift+Opt+Cmd+h」を設定
- 「マウス」の「軌道の速さ」と「スクロールの速さ」を半分くらいに変更

## 手動インストール
パッケージマネージャで管理できないツールを手動でインストールします。

### フォント(Myrica)
[公式](https://myrica.estable.jp/) から `Myrica.ttc` をダウンロードします。  
ダウンロードしたファイルを解凍し、 `Myrica.TTC` ファイルを実行して `Myrica M` のフォントをインストールします。

### Google Chrome
[公式](https://www.google.com/intl/ja_jp/chrome/) からインストールします。  

### Karabiner-Elements
デュアルキーボードのための仮想キーボードマネージャです。  
[公式](https://karabiner-elements.pqrs.org/) からインストールします。  
HHKB2台をそれぞれ追加したら、「Function Keys」の項目を「For all devices」にして、f1〜f12までをそのまま同じキーで設定しておけば大丈夫です。

### Logi Options
Logicoolマウス用のドライバツールです。  
[公式](https://www.logicool.co.jp/ja-jp/software/options.html) からインストールします。  
インストールしたらMacのシステム環境設定からBluetoothを選択し、マウスを追加します。  
Logi Optionsを起動して、マウスが認識されているか確認したら、側面ボタン1に「戻る」を、側面ボタン2に「cmd+w」を割り当てておきます。  
ポインタのスピード、スクロール速度をそれぞれ半分くらいのところに変更しておきます。

### Monosnap
スクショの撮影・編集や画面操作の録画ができる便利なツールです。  
[Mac App Store](https://apps.apple.com/jp/app/monosnap-screenshot-editor/id540348655?mt=12) からインストールします。  
インストールしたら、Preferencesを開いて、以下の設定を変更しておきます。
- 「Advanced」を、「Image File Format」->「JPEG」, 「JPEG Quality」->「90%」

### その他会社から指定されているもの
会社から指定されたツール(Zoomやらを)入れます。  
カメラやマイクを使うツールはちゃんとテストしておきましょう。  
Visual Studio Code, Docker, SlackなどはHomebrewのCaskで入れるのでスキップして大丈夫です。

## dotfilesダウンロード
リポジトリのファイルをダウンロードします。  
GitHub画面上の、 「<> Code」->「Download ZIP」 ボタンからダウンロードできます。  
ダウンロードしたら解凍しておきます。

## ターミナル
Macにデフォルトで入っているターミナルにMonokaiテーマを適用します。  
ターミナルを起動して、メニューから環境設定を開きます。  
ウィンドウ内のボタンからプロファイルの読み込みを選択し、解凍したファイルの「terminal」->「Monokai.terminal」を読み込みます。

## Homebrew
[公式](https://brew.sh/index_ja) のインストール手順に従ってインストールします。  
解凍したファイルの中からBrewfileのあるディレクトリに移動し、以下のコマンドを実行して、終わるまで待ちます。

```zsh
brew bundle 
```

## spectacle
Preferencesを開いて、以下の設定を変更しておきます。
- Center: opt+cmd+c
- FullScreen: opt+cmd+f
- Left Half: opt+cmd+h
- Right Half: opt+cmd+l
- Top Half: opt+cmd+k
- Bottom Half: opt+cmd+j

## Slack
ログインなどを済ませておきます。  
ハドルやビデオ通話をテストしてみて、権限が許可されているか、マイクやカメラが入っているか確認しておくと良いでしょう。

## Docker
ログインなどを済ませておきます。

## git
ホームディレクトリに、解凍したファイルの.gitconfigを配置します。  
名前とメールアドレスを会社のものに変更します。  
GitHubにログインして、鍵の設定などを行なって、リモートリポジトリにアクセスできるか確認します。

## zsh
ホームディレクトリに、解凍したファイルの.zshrcを配置もしくは、既にある場合は中身を追加します。  
使わないパスやエイリアスを消しておきます。

## tmux
ホームディレクトリに、解凍したファイルの.tmux.confを配置します。

## Neovim
 [packer.nvim#quickstart](https://github.com/wbthomason/packer.nvim#quickstart) を参考にパッケージマネージャをインストールします。  
ホームディレクトリの.config/nvim下に、解凍したファイルの.config/nvimの中身を配置します。  
nvimを起動して、コマンド「:PackerUpdate」を実行します。

## Visual Studio Code
Visual Studio Codeを起動します。  
解凍したファイルのvscode/extensions.jsonの中身に書いてある拡張機能をインストールします。  
「管理」->「設定」->「設定(JSON)を開く」で設定ファイルを開き、解凍したファイルのvscode/settings.jsonの中身で上書きします。  
「管理」->「キーボードショートカット」->「キーボードショートカットを開く(JSON)」で設定ファイルを開き、解凍したファイルのvscode/keybindings.jsonの中身で上書きします。  

### Ruby
拡張機能を有効にするために、以下のコマンドでsolargraphをインストールしておく必要があります。

```
gem install solargraph
```
