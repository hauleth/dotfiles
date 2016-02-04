" vim: foldmethod=marker foldlevel=0 foldenable

" Plugins {{{
call plug#begin('~/.local/nvim/plugins')

Plug 'tpope/vim-sensible'

" Visual
Plug 'bling/vim-bufferline'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'raymond-w-ko/vim-niji'
Plug 'kshenoy/vim-signature'

" Languages
Plug 'LnL7/vim-nix'
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'lambdatoast/elm.vim'
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'slim-template/vim-slim'
Plug 'vim-ruby/vim-ruby'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Project management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'wakatime/vim-wakatime'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" TMux Integration
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'racer-rust/vim-racer'
Plug 'mattn/emmet-vim'

" Code manipulation
Plug 'Raimondi/delimitMate'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Movements & Search
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'

" Build & Configuration
Plug 'benekastah/neomake'
Plug 'dahu/EditorConfig'
Plug 'tpope/vim-projectionist'

" Utils
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mjbrownie/swapit'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

call plug#end()
" }}}
" Colors {{{
" Show 80 column
let &colorcolumn="81,+" . join(range(1,100), ',+')
set cursorline

" Use Dark Solarized theme
let base16colorspace=256
set background=dark
colorscheme base16-ocean
" }}}
" Per directory .nvimrc {{{
set exrc
" Disable unsafe commands in local .nvimrc
set secure
" }}}
" User interface {{{
" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

" Display tabs and trailing spaces visually
set list listchars=tab:→\ ,trail:·

" Line numbers are good
set number

" Show current mode down the bottom
set noshowmode

" Set utf8 as standard encoding
set encoding=utf8

" Shorten interruptive command output
set shortmess=atI

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" Wrap line on movements
set whichwrap+=<,>,h,l,[,]

" Use system clippboard as default
set clipboard=unnamed

" Use proper english
set spelllang=en_gb
" }}}
" Autoupdate {{{
" Automatically reload changed files
set autoread

" Save on buffer change
set autowriteall
" }}}
" Identation {{{
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set textwidth=80
set nowrap       " Don't wrap lines
set linebreak    " Break lines at convenient points
set formatoptions+=t
" }}}
" Key mappings {{{
let mapleader = "\<space>"

" Swap 'go to marker' mappings
nnoremap ' `
nnoremap ` '

" <Home> goes to the beginning of the text on first press and to the beginning
" of the line on second press. It alternates afterwards.
nnoremap <expr> <Home> virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'

nnoremap gV `[v`]

" Closing
nnoremap ZS :xa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>

" Split line at cursor position
nnoremap K     i<CR><Esc>k$
nnoremap Q     K

" Simplify switching to EX mode
nnoremap ; :
vnoremap ; :
nnoremap : ;

" Fast paste from system clipboard
inoremap <C-R><C-R> <C-R>*

" Some useful toggles for plugins
noremap <F2> :UndotreeToggle<CR>
noremap <F3> :NumbersToggle<CR>
noremap <F4> :IndentGuidesToggle<CR>
" }}}
