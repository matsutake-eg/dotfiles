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
" カラースキームをmonokaiに
colorscheme monokai
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
" ウィンドウの移動を簡略化
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" ビジュアルモードの選択範囲を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" プラグイン用の設定
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plugin 'tpope/vim-surround'
"The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
Plugin 'scrooloose/nerdtree'
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell. It runs files through external syntax checkers and displays any resulting errors to the user.
Plugin 'scrooloose/syntastic'
" A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plugin 'prettier/vim-prettier'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" Syntax file and other settings for TypeScript. The syntax file is taken from this blog post.
Plugin 'leafgarland/typescript-vim'
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plugin 'pangloss/vim-javascript'
" Vim syntax highlighting for Vue components.
Plugin 'posva/vim-vue'
" This plugin adds Go language support for Vim, with the following main features
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on
