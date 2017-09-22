" vi: foldmethod=marker
scriptencoding utf-8

" Unload unneeded plugins {{{
let g:loaded_netrw         = 1
let g:loaded_netrwPlugin   = 1
let g:loaded_vimballPlugin = 1
" }}}

" Plugins {{{
call plug#begin('~/.local/nvim/plugins')

Plug 'hauleth/blame.vim'

Plug 'mhinz/vim-startify'

" Leader {{{
Plug 'hecal3/vim-leader-guide', { 'on': 'LeaderGuide' }
let mapleader = "\<space>"
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
" }}}

" Languages
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'elixir-lang/vim-elixir'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'posva/vim-vue'
Plug 'rodjek/vim-puppet'

Plug 'lambdalisue/gina.vim'
nnoremap U  :<C-u>LeaderGuide 'U'<CR>
nnoremap Up :<C-u>Gina push<CR>
nnoremap Us :<C-u>keepalt Gina status -s<CR>
nnoremap Ud :<C-u>keepalt Gina diff :<CR>
nnoremap Ub :<C-u>keepalt Gina branch<CR>
nnoremap UB :<C-u>keepalt Gina blame :<CR>
nnoremap Uc :<C-u>keepalt Gina commit<CR>
nnoremap Uu :<C-u>Gina pull --all<CR>
nmap     UU Uu

cabbr Gita Gina
cabbr Gita! Gina!
cabbr G Gina
cabbr G! Gina!
cabbr git Gina
cabbr git! Gina!
cabbr Git Gina
cabbr Git! Gina!

" Fuzzy find
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install --bin', 'on': ['SK'] }
nnoremap <leader><leader> :<C-u>SK<CR>

" File management
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" Completion
Plug 'racer-rust/vim-racer'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'roxma/nvim-completion-manager' |
            \ Plug 'roxma/nvim-cm-racer'

" Code manipulation
Plug 'jiangmiao/auto-pairs'
Plug 'tommcdo/vim-exchange', { 'on': ['<Plug>(Exchange)',
            \ '<Plug>(ExchangeClear)', '<Plug>(ExchangeLine)'] }
nmap cx  <Plug>(Exchange)
xmap X   <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim', { 'on': ['SplitjoinJoin', 'SplitjoinSplit'] }
nnoremap <silent> gJ :<C-u>SplitjoinJoin<CR>
nnoremap <silent> gS :<C-u>SplitjoinSplit<CR>

Plug 'hauleth/sad.vim', { 'on': ['<Plug>(sad-change-forward)'] }
nmap c <Plug>(sad-change-forward)
vmap c <Plug>(sad-change-forward)
nmap C <Plug>(sad-change-forward)$
nnoremap cc cc
nnoremap <leader>c c
nnoremap <leader>C C
vnoremap <leader>c c

" Build & Configuration
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-projectionist'
Plug 'direnv/direnv.vim'

" Utils
Plug 'wellle/targets.vim'
Plug 'mjbrownie/swapit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/tpope-vim-abolish'
Plug 'moll/vim-bbye', { 'on': ['Bdelete'] }
Plug 'romainl/vim-qf'
let g:qf_auto_open_quickfix = 0

Plug 'justinmk/vim-sneak'
nmap : <Plug>Sneak_;
vmap : <Plug>Sneak_;
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

Plug 'rizzatti/dash.vim', { 'on': ['Dash', 'DashKeywords', '<Plug>DashSearch'] }
nmap gK <Plug>DashSearch

call plug#end()
" }}}
" Colors {{{
set termguicolors
colorscheme blame
" }}}
" User interface {{{
" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

syntax sync minlines=500

" Display tabs and trailing spaces visually
set list
set listchars=tab:→\ ,trail:·,nbsp:␣
set conceallevel=2

" Show current mode down the bottom
set noshowmode showcmd

" Shorten interruptive command output
set shortmess=atI

set nohidden
set autowriteall

" Wrap line on movements
set whichwrap+=[,]

" Keep cursor in the middle
set scrolloff=9999

set iskeyword+=-

" Show 80 column
let &colorcolumn='81'

set mouse=a
set splitright splitbelow
set diffopt+=vertical,iwhite

func! SetStatusline()
    let &laststatus = 2
    let &statusline = "%<%2n » %f%{&modified ? ' +' : ''} «"
                \ . "%=%4c:%l"
endfunc

call SetStatusline()
augroup StatusLine
    au!
    autocmd BufEnter * call SetStatusline()
augroup END

" }}}
" Identation {{{
set shiftwidth=0
set softtabstop=-1
set tabstop=4
set expandtab

set textwidth=80
set nowrap       " Don't wrap lines
set linebreak    " Break lines at convenient points
set formatoptions+=l
" }}}
" Search {{{
" Smart case searches
set ignorecase smartcase inccommand=nosplit
command! -nargs=+ Grep silent grep <q-args>
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
inoremap <CR> <C-]><CR>
" Smart <Home> and `^` {{{
" <Home> goes to the beginning of the text on first press and to the beginning
" of the line on second press. It alternates afterwards.
nnoremap <expr> ^ virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
" }}}
" File closing {{{
nnoremap ZS :wa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>
" }}}
" Simplify switching to Command mode {{{
nnoremap ; :
vnoremap ; :
nnoremap q; q:
" }}}
" Fast paste from system clipboard {{{
inoremap <C-R><C-R> <C-R>*
nnoremap Y y$
nnoremap <leader>y "+y
nnoremap <leader>p "+p
" }}}
" Folding {{{
nnoremap <expr> <CR> foldlevel('.')?'za':"\<CR>"
" }}}
" Format {{{
nnoremap g= gg=Gg``
noremap Q gq
nnoremap gQ gggqG``
" }}}
" Search {{{
" Easier change and replace word
nnoremap <leader>, :nohlsearch<CR>
nnoremap <C-c> <C-c>:nohlsearch<CR>
" }}}
" Tabs {{{
nnoremap ]w gt
nnoremap [w gT
" }}}
" }}}
" Configuration {{{
" Formatting & Cleaning {{{
command! Clean let _s = @/ | %s/\s\+$//e | let @/ = _s | set nohlsearch
" }}}
augroup align_windows
    au!
    autocmd VimResized * wincmd =
augroup END

command! Note setlocal nobl bt=nofile bh=delete

let g:sql_type_default = 'pgsql'
" }}}
