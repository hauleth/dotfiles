" vim: foldmethod=marker foldlevel=0 foldenable

" Plugins {{{
call plug#begin()

Plug 'tpope/vim-sensible'

" Visual
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'nathanaelkane/vim-indent-guides'

" Languages
Plug 'Blackrush/vim-gocode'
Plug 'Shirk/vim-gas'
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'LnL7/vim-nix'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Project management
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'farseer90718/unite-workflow'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'

" TMux Integration
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Completion
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" Code manipulation
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/delimitMate'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Utils
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'dahu/EditorConfig'
Plug 'jaxbot/github-issues.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mjbrownie/swapit'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

call plug#end()
" }}}
" Colors {{{
" Show 80 column
set colorcolumn=80
set cursorline

" Use Dark Solarized theme
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
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
" }}}
" Key mappings {{{
let mapleader = ','

" Swap 'go to marker' mappings
nnoremap ' `
nnoremap ` '

" Buffers
noremap <leader>b   :Unite -buffer-name=buffers -immediately -no-split buffer<CR>

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

" Yanks
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <silent> <Leader>y :Unite -buffer-name=yanks register history/yank<CR>

" Fast paste from system clipboard
inoremap <C-R><C-R> <C-R>+

" Some useful toggles for plugins
noremap <F2> :UndotreeToggle<CR>
noremap <F3> :NumbersToggle<CR>
noremap <F4> :IndentGuidesToggle<CR>

" Git Fugitive commands
noremap <leader>gst :Gstatus<CR>
noremap <leader>gci :Gcommit<CR>
noremap <leader>gd  :Gdiff<CR>
" }}}
" Search {{{
" Smart case searches
set ignorecase
set smartcase

" Better search
set magic

" Clear search highlights
noremap <leader>l :nohlsearch<CR>
" }}}
" Files, backups and undo {{{
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Save on buffer change
set autowriteall
au FocusLost * silent! w

" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir -p ~/.cache/backups > /dev/null 2>&1
set undodir=~/.cache/backups
set undofile
" }}}
" Identation and folding {{{
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set textwidth=80
set nowrap       " Don't wrap lines
set linebreak    " Break lines at convenient points
set formatoptions+=t

" Formatting and cleaning
noremap <leader>ff :Autoformat<CR>
noremap <leader>fc :Clean<CR>

" Set fold method
set foldmethod=syntax
set foldlevel=3
set foldnestmax=5

" Text folding
nnoremap <space> za
" }}}
" Extra commands {{{
" Remove all trailing whitespaces
command! Clean %s/\s\+$//e | nohlsearch

" Save as root
command! W w !sudo tee % > /dev/null
" }}}
