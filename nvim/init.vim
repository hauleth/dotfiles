" vim: foldmethod=marker foldlevel=0 foldenable

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $EDITOR="nvr"

" Plugins {{{
call plug#begin('~/.local/nvim/plugins')

" Visual
Plug 'ap/vim-buftabline'
Plug 'cocopon/iceberg.vim'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'dag/vim-fish'
Plug 'hauleth/vim-ketos'
Plug 'slashmili/alchemist.vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File management
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" Completion
Plug 'racer-rust/vim-racer'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } | Plug 'fishbullet/deoplete-ruby'

" Code manipulation
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

" Build & Configuration
Plug 'benekastah/neomake'
Plug 'tpope/vim-projectionist'
Plug 'editorconfig/editorconfig-vim'

" Utils
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mjbrownie/swapit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/Goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'wellle/targets.vim'

call plug#end()
" }}}
" Colors {{{
set termguicolors
set background=dark
colorscheme iceberg
" }}}
" User interface {{{
" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

" Display tabs and trailing spaces visually
set list
set listchars=tab:→\ ,trail:·,nbsp:␣

" Show current mode down the bottom
set noshowmode
set showcmd

" Shorten interruptive command output
set shortmess=atI

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" Wrap line on movements
set whichwrap+=[,]

" Use system clippboard as default
set clipboard=unnamed

" Show me more!
set scrolloff=10

set iskeyword+=-

" Show 80 column
let &colorcolumn="81,+" . join(range(1,200), ',+')
set cursorline

set splitright
set splitbelow

set timeoutlen=500
" }}}
" Identation {{{
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set textwidth=80
set nowrap       " Don't wrap lines
set linebreak    " Break lines at convenient points
set formatoptions+=l
" }}}
" Folding {{{
set foldmethod=marker
set foldlevel=0
" }}}
" Search {{{
" Smart case searches
set ignorecase
set smartcase
" }}}
" Backup, swap & undo {{{
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set noswapfile

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if &diff
  set noundofile
  set undolevels=-1
  set undoreload=-1
else
  if !isdirectory($HOME . "/.cache/backups")
    silent !mkdir -p ~/.cache/backups > /dev/null 2>&1
  endif
  let &undodir=$HOME . "/.cache/backups"
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
" }}}
" Mappings {{{
" Leader {{{
let mapleader = "\<space>"
" }}}
" Store relative line number jumps in the jumplist {{{
" Treat long lines as break lines (useful when moving around in them).
noremap <expr> j v:count > 1 ? 'm`' . v:count . 'j' : 'gj'
noremap <expr> k v:count > 1 ? 'm`' . v:count . 'k' : 'gk'
" }}}
" Disable arrows {{{
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap! <up> <nop>
noremap! <down> <nop>
noremap! <left> <nop>
noremap! <right> <nop>
" }}}
" Swap 'go to marker' mappings {{{
nnoremap ' `
nnoremap ` '
" }}}
" Smart <Home> and `^` {{{
" <Home> goes to the beginning of the text on first press and to the beginning
" of the line on second press. It alternates afterwards.
nnoremap <expr> ^ virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
nmap <Home> ^
" }}}
" Reselect last Visual {{{
nnoremap gV `[v`]
" }}}
" File closing {{{
nnoremap ZS :wa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>
" }}}
" Simplify switching to Command mode {{{
noremap ; :
noremap : ;
noremap q; q:
" }}}
" Fast paste from system clipboard {{{
inoremap <C-R><C-R> <C-R>*
" }}}
" Folding {{{
nnoremap <CR> za
au CmdwinEnter * nunmap <CR>
au CmdwinLeave * nnoremap <CR> za
" }}}
" FZF {{{
nnoremap <leader><leader> :<C-u>Files<CR>
nnoremap <leader>b :<C-u>Buffers<CR>
" }}}
" UndoTree {{{
noremap <F2> :<C-u>UndotreeToggle<CR>
" }}}
" Format {{{
noremap g= gg=Gg``
noremap Q gq
" }}}
" Search {{{
" Easier change and replace word
nnoremap c. *Ncgn

nnoremap <leader>, :nohlsearch<CR>
nnoremap <C-c> <C-c>:nohlsearch<CR>

" Search for selection
vnoremap // y/<C-r>"<CR>
" }}}
" Git {{{
nnoremap U <nop>
nnoremap Us :<C-u>Gstatus<CR>
nnoremap Up :<C-u>Git push<CR>
nnoremap Ud :<C-u>Gdiff<CR>
nnoremap UB :<C-u>Gblame<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Um :<C-u>Gmerge<CR>
nnoremap Uu :<C-u>Git pull --all<CR>
nnoremap Uf :<C-u>GitFiles<CR>
nnoremap Ul :<C-u>GV<CR>
nnoremap UL :<C-u>GV!<CR>
nmap UU Uu
" }}}
" Tabs {{{
nnoremap <C-w>t :<C-u>tabnew <bar> Dirvish<CR>
nnoremap ]w gt
nnoremap [w gT
" }}}
" Yank to the end of line {{{
nnoremap Y y$
" }}}
" Terminal {{{
nnoremap <C-q>c :<C-u>term<CR>
nnoremap <C-q>s :<C-u>split <bar> term<CR>
nnoremap <C-q>v :<C-u>vsplit <bar> term<CR>

tnoremap <C-q><C-q> <C-\><C-n>
" }}}
" }}}
" Configuration {{{
" Grep {{{
if executable('ag')
  set grepformat^=%f:%l:%c:%m
  set grepprg=ag\ --vimgrep\ --hidden
endif
" }}}
" Unload unneeded plugins {{{
let g:loaded_netrw         = 1
let g:loaded_netrwPlugin   = 1
let g:loaded_vimballPlugin = 1
" }}}
" Formatting & Cleaning {{{
command! Clean let _s=@/ | %s/\s\+$//e | let @/=_s | set nohlsearch
" }}}
" Neomake {{{
augroup syntax_check
  au!
  autocmd BufWritePost * silent if !&diff | Neomake | endif
augroup END

let g:neomake_warning_sign = {
      \ 'text': '‼',
      \ 'texthl': 'Warning',
      \ }
" }}}
" Signify {{{
let g:signify_sign_add = '▌'
let g:signify_sign_delete = '▖'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_change = '▐'
let g:signify_sign_changedelete = '▞'

let g:signify_sign_show_count = 0
" }}}
" Limelight {{{
let g:limelight_conceal_ctermfg = 'lightgray'
let g:limelight_conceal_guifg = '#666666'
" }}}
" Terminal colors {{{
let g:terminal_color_0 = "#2a3158"
let g:terminal_color_1 = "#e27878"
let g:terminal_color_2 = "#89b8c2"
let g:terminal_color_3 = "#e4aa80"
let g:terminal_color_4 = "#84a0c6"
let g:terminal_color_5 = "#d1a8ad"
let g:terminal_color_6 = "#adc1cb"
let g:terminal_color_7 = "#c6c8d1"
let g:terminal_color_8 = "#444b71"
let g:terminal_color_9 = "#e2a478"
let g:terminal_color_10 = "#b4be82"
let g:terminal_color_11 = "#d8e599"
let g:terminal_color_12 = "#3e445e"
let g:terminal_color_13 = "#673e43"
let g:terminal_color_14 = "#686f9a"
let g:terminal_color_15 = "#d4d5db"
" }}}
" }}}
let g:deoplete#enable_at_startup = 1
