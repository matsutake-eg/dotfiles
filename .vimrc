" 表示・設定系
" カーソルが何行目の何列目に置かれているかを表示
set ruler
" 挿入モードでTABキーを押した際、対応する数のスペースを入力
set expandtab
" 画面上でタブ文字が占める幅の指定
set tabstop=2
" 自動インデントでずれる幅の指定
set shiftwidth=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅の指定
set softtabstop=2
" 改行時に前の行のインデントを継続
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減
set smartindent
" 256色対応
set t_Co=256
" エンコード, ファイルエンコード
set encoding=utf-8
set fileencoding=utf-8
" スクロールする時に下を空ける
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" ビープ音を消す
set belloff=all
" OSのクリップボードを使う
set clipboard=unnamed
" 行番号を表示
set number
" compatibleオプションをオフ
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示
set showmatch
" 対応括弧の表示秒数を3秒
set matchtime=3
" ウィンドウの幅より長い行を折り返し、次の行に続けて表示
set wrap
" 入力されているテキストの最大幅を無効
set textwidth=0
" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" インデントをshiftwidthの倍数に丸める
set shiftround
" 行末1文字までカーソルを移動
set virtualedit=onemore
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字のみで検索したときに大文字小文字を無視
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索結果をハイライト表示
set hlsearch
" マウスモード有効
set mouse=a
" コマンドを画面最下部に表示
set showcmd
" ◆や○文字が崩れる問題を解決
set ambiwidth=double
" 構文毎に文字色を変化
syntax on

" 操作系
" インサートモードでbackspaceを有効
set backspace=indent,eol,start
" 入力モード中に素早くjjと入力した場合はESC
inoremap jj <Esc>
" 入力モード中に素早くkkと入力した場合は予測変換
inoremap kk <C-n>
" ウィンドウの移動を簡略化
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" ビジュアルモードの選択範囲を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" vim-plugでプラグイン導入
" :PlugInstallでインストール
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-p> :Unite buffer<CR>
" ファイル一覧
noremap <C-n> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('vsplit')
" ESCキーを2回押すと終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""
" ファイルをtree表示してくれる
" :NERDTreeでカレントディレクトリをツリー表示
Plug 'scrooloose/nerdtree'
" Ruby向けにendを自動挿入
Plug 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
" Shift+Vで対象の範囲を選択し、Ctrl--(コントロールキー+ハイフン+ハイフン)でコメント付け外し
Plug 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
" cs'"でシングルクオートをダブルクオートに置換
" cs'<p>でシングルクオート文字列を<p>タグで囲む
Plug 'tpope/vim-surround'
" ログファイルを色づけ
Plug 'vim-scripts/AnsiEsc.vim'

call plug#end()
