colorscheme monokai

set clipboard=unnamed
set hidden

set smartindent
set textwidth=0

set tabstop=2
set softtabstop=2
set shiftwidth=2
set listchars=tab:\ \ ,trail:-,extends:»,precedes:«,nbsp:%

set number
set wrap
set scrolloff=5

set ignorecase
set smartcase

set showmatch
set matchtime=1

nnoremap Y y$
nnoremap YY :%y<CR>
nnoremap DD :%d<CR>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Esc><Esc> :noh<CR>

nnoremap <Right> :ALEHover<CR>
nnoremap <Up> :ALEGoToDefinition<CR>
nnoremap <Down> :ALEFindReferences<CR>
nnoremap <F10> :bufdo e<CR>
nnoremap <F11> :ALERename<CR>
nnoremap <F12> :ALEGoToDefinitionInSplit<CR>
nnoremap <F5> :ALEResetBuffer<CR>
if has("autocmd")
  autocmd FileType go nnoremap <Right> :GoInfo<CR>
	autocmd FileType go nnoremap <Up> :GoDef<CR>
	autocmd FileType go nnoremap <Down> :GoReferrers<CR>
  autocmd FileType go nnoremap <F11> :GoRename<CR>
endif

inoremap jj <Esc>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/Users/matsutake/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/matsutake/.cache/dein')
  call dein#begin('/Users/matsutake/.cache/dein')
  call dein#add('/Users/matsutake/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('preservim/nerdtree')
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
	  call dein#add('roxma/nvim-yarp')
	  call dein#add('roxma/vim-hug-neovim-rpc')
	endif
  call dein#add('itchyny/lightline.vim')
  call dein#add('kien/ctrlp.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('posva/vim-vue')
  call dein#add('fatih/vim-go')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('w0rp/ale')
  call dein#add('townk/vim-autoclose')
  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#end()
  call dein#save_state()
endif

let NERDTreeShowHidden = 1
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = {
\   'dir':  '\v[\/](node_modules|build|dist|\.(git|hg|svn))$',
\   'file': '\v\.(exe|so|dll|swp|zip|gif|jpg|png)$',
\   'link': 'some_bad_symbolic_links',
\}
let g:go_fmt_command = "goimports"
let g:go_rename_command = "gorename"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'vue': ['eslint', 'vls'],
\}
let g:ale_rename_tsserver_find_in_comments = 1
let g:ale_rename_tsserver_find_in_strings = 1
let g:ale_lint_on_enter = 1
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
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgray ctermbg=236

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------