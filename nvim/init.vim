scriptencoding utf-8

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $EDITOR='nvr'

" Plugins {{{
let s:plugins = filereadable(expand($HOME . '/.config/nvim/autoload/plug.vim', 1))
if !s:plugins
  silent call mkdir(expand($HOME . '/.config/nvim/autoload', 1), 'p')
  exe '!curl -fLo '.expand($HOME . '/.config/nvim/autoload/plug.vim', 1)
        \ .' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/nvim/plugins')

Plug 'mhinz/vim-startify'

" Visual
Plug 'ap/vim-buftabline'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'hauleth/vim-ketos'
Plug 'tpope/vim-markdown'
Plug 'elixir-lang/vim-elixir' |
      \ Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' |
      \ Plug 'junegunn/gv.vim'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } |
      \ Plug 'junegunn/fzf.vim'

" File management
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" Completion
Plug 'ludovicchabant/vim-gutentags'
Plug 'racer-rust/vim-racer'

" Code manipulation
Plug 'jiangmiao/auto-pairs'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'

" Build & Configuration
Plug 'tpope/vim-dispatch' |
      \ Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-projectionist'
Plug 'w0rp/ale'

" Utils
Plug 'kopischke/vim-fetch'
Plug 'wellle/targets.vim'
Plug 'mjbrownie/swapit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/limelight.vim'
Plug 'kana/vim-niceblock'
Plug 'moll/vim-bbye'

call plug#end()
" }}}
" Colors {{{
set termguicolors
set background=dark
colorscheme ocean
" }}}
" User interface {{{
" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

" Display tabs and trailing spaces visually
set list
set listchars=tab:→\ ,trail:·,nbsp:␣
set conceallevel=2

" Show current mode down the bottom
set showmode showcmd

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
let &colorcolumn='81,+' . join(range(1,200), ',+')
set cursorline

" set belloff=all

set splitright splitbelow
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
  if !isdirectory($HOME . '/.cache/backups')
    silent !mkdir -p ~/.cache/backups > /dev/null 2>&1
  endif
  let &undodir=$HOME . '/.cache/backups'
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
" }}}
" Mappings {{{
" Leader {{{
let mapleader = "\<space>"
" }}}
nnoremap Y y$
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
" Smart <Home> and `^` {{{
" <Home> goes to the beginning of the text on first press and to the beginning
" of the line on second press. It alternates afterwards.
nnoremap <expr> ^ virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
" }}}
" File closing {{{
func! Close()
  let l:bufcount = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

  if l:bufcount == 1
    xit
  else
    update | Bdelete
  endif
endfunc
nnoremap ZZ :call Close()<CR>
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
nnoremap <expr> <CR> foldlevel('.')?'za':"\<CR>"
" }}}
" FZF {{{
nnoremap <leader><leader> :<C-u>Files<CR>
nnoremap <leader>b :<C-u>Buffers<CR>
" }}}
" Format {{{
noremap g= gg=Gg``
noremap Q gq
" }}}
" Search {{{
" Easier change and replace word
nnoremap <leader>, :nohlsearch<CR>
nnoremap <C-c> <C-c>:nohlsearch<CR>
" }}}
" Tabs {{{
nnoremap <C-w>t :<C-u>tabnew <bar> Dirvish<CR>
nnoremap ]w gt
nnoremap [w gT
" }}}
" }}}
" Configuration {{{
" Unload unneeded plugins {{{
let g:loaded_netrw         = 1
let g:loaded_netrwPlugin   = 1
let g:loaded_vimballPlugin = 1
" }}}
" Formatting & Cleaning {{{
command! Clean let _s = @/ | %s/\s\+$//e | let @/ = _s | set nohlsearch
" }}}
augroup align_windows
  au!
  autocmd VimResized * wincmd =
augroup END
" }}}
