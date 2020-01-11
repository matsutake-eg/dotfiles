set noswapfile
set nowritebackup
set nobackup

set encoding=utf-8
set fileencoding=utf-8

set hidden
set switchbuf=useopen

set belloff=all

set mouse=a
set clipboard=unnamed

set number
set ruler
set wrap
set laststatus=2
set showcmd
set scrolloff=5

set textwidth=0
set autoindent
set smartindent

set shiftround

set virtualedit=onemore

set tabstop=2
set softtabstop=2
set shiftwidth=2
set list
set listchars=tab:\ \ ,trail:-,extends:»,precedes:«,nbsp:%
set ambiwidth=double

set ignorecase
set smartcase
set incsearch
set hlsearch

set matchpairs& matchpairs+=<:>
set showmatch
set matchtime=3

set t_Co=256
syntax enable
colorscheme monokai

inoremap jj <Esc>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set backspace=indent,eol,start

" Vundle is short for Vim bundle and is a Vim plugin manager.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
" A light and configurable statusline/tabline plugin for Vim
Plugin 'itchyny/lightline.vim'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = {
\   'dir':  '\v[\/](node_modules|build|dist|\.(git|hg|svn))$',
\   'file': '\v\.(exe|so|dll|swp|zip|gif|jpg|png)$',
\   'link': 'some_bad_symbolic_links',
\}
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
let g:go_fmt_command = "goimports"
:command GR GoRun
" UltiSnips is the ultimate solution for snippets in Vim. It has many features, speed being one of them.
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" This is an EditorConfig plugin for Vim. This plugin can be found on both GitHub and Vim online.
Plugin 'editorconfig/editorconfig-vim'
" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your text files, and acts as a Vim Language Server Protocol client.
Plugin 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tslint'],
\   'vue': ['eslint', 'vls'],
\}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'html': ['prettier'],
\   'vue': ['prettier'],
\   'css': ['prettier'],
\   'less': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_list_window_size = 3
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
"Indent Guides is a plugin for visually displaying indent levels in Vim.
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgray ctermbg=236

call vundle#end()
filetype plugin indent on
