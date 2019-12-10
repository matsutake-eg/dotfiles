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
" ステータスを2行に
set laststatus=2
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
set listchars=trail:-,extends:»,precedes:«,nbsp:%,eol:↲
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
syntax enable
" カラースキームをmonokaiに
colorscheme monokai

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
"The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
Plugin 'scrooloose/nerdtree'
" A light and configurable statusline/tabline plugin for Vim
Plugin 'itchyny/lightline.vim'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Syntax file and other settings for TypeScript. The syntax file is taken from this blog post.
Plugin 'leafgarland/typescript-vim'
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plugin 'pangloss/vim-javascript'
" Vim syntax highlighting for Vue components.
Plugin 'posva/vim-vue'
" This  plugin was  born  as a  personal  need to  get  some little  special features from other editors into my  preferred one
Plugin 'townk/vim-autoclose'
" This plugin adds Go language support for Vim, with the following main features
Plugin 'fatih/vim-go'
" This is an EditorConfig plugin for Vim. This plugin can be found on both GitHub and Vim online.
Plugin 'editorconfig/editorconfig-vim'
" A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plugin 'prettier/vim-prettier'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your text files, and acts as a Vim Language Server Protocol client.
Plugin 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'vue': ['eslint'],
\}
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dE %dW',
    \   all_errors,
    \   all_non_errors
    \)
endfunction
let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified', 'ale'],
  \  ]
  \},
  \'component_function': {
  \  'ale': 'LinterStatus'
  \}
\ }
highlight ALEError ctermbg=DarkMagenta

call vundle#end()
filetype plugin indent on
