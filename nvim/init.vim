" vim: foldmethod=marker foldlevel=0 foldenable

" Plugins {{{
call plug#begin('~/.local/nvim/plugins')

" Visual
Plug 'bling/vim-bufferline'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
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
Plug 'vim-ruby/vim-ruby'
Plug 'puppetlabs/puppet-syntax-vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File management
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'

" Time management
Plug 'wakatime/vim-wakatime'

" TMux integration
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
Plug 'd0c-s4vage/vim-morph'

" Build & Configuration
Plug 'benekastah/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-projectionist'

" Utils
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mjbrownie/swapit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

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
" User interface {{{
" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

" Display tabs and trailing spaces visually
set list listchars=tab:→\ ,trail:·

" Line numbers are good
set number
set relativenumber

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

" Show me more!
set scrolloff=10

" Do not preview
set completeopt-=preview
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
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Fast paste from system clipboard
inoremap <C-R><C-R> <C-R>*

" Some useful toggles for plugins
noremap <F2> :UndotreeToggle<CR>
noremap <F3> :NumbersToggle<CR>
" }}}
