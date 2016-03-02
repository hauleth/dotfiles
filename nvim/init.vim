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
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
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
" Folding {{{
set foldmethod=marker
set foldlevel=0
" }}}
" Search {{{
" Smart case searches
set ignorecase
set smartcase

" Better search
set magic
" }}}
" Backup & undo {{{
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set updatecount=10

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if !isdirectory($HOME . "/.cache/backups")
  silent !mkdir -p ~/.cache/backups > /dev/null 2>&1
endif
set undodir=~/.cache/backups
set undofile
" }}}
" Tags {{{
set tags+=.tags
augroup ctags
  au!
  au BufWritePost * :NeomakeSh ctags -R .
augroup END
" }}}
" Mappings {{{
" Leader {{{
let mapleader = "\<space>"
" }}}
" Swap 'go to marker' mappings {{{
nnoremap ' `
nnoremap ` '
" }}}
" Smart <Home> and `^` {{{
" <Home> goes to the beginning of the text on first press and to the beginning
" of the line on second press. It alternates afterwards.
nnoremap <expr> <Home> virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
nnoremap <expr> ^ virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
" }}}
" Reselect last Visual {{{
nnoremap gV `[v`]
" }}}
" File closing {{{
nnoremap ZS :xa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>
" }}}
" Split line at cursor position {{{
nnoremap K     i<CR><Esc>k$
nnoremap Q     K
" }}}
" Simplify switching to Command mode {{{
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" }}}
" Fast paste from system clipboard {{{
inoremap <C-R><C-R> <C-R>*
" }}}
" Folding {{{
nnoremap <CR> za
" }}}
" FZF {{{
noremap <C-p> :<C-u>Files<CR>
noremap gt :<C-u>Tags<CR>
nnoremap gb :<C-u>Buffers<CR>
" }}}
" UndoTree {{{
noremap <F2> :UndotreeToggle<CR>
" }}}
" EasyAlign {{{
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
" }}}
" Format whole file {{{
noremap g= :<C-u>Format<CR>
" }}}
" Search {{{
nnoremap <silent> <leader><leader> :<C-u>set nohlsearch <bar> update<CR>

noremap c* *``cgn
noremap c# #``cgN
noremap cg* g*``cgn
noremap cg# g#``cgN
" }}}
" Git {{{
nnoremap U <nop>
nnoremap Us :<C-u>Gstatus<CR>
nnoremap Ud :<C-u>Gdiff<CR>
nnoremap Ub :<C-u>Gblame<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Um :<C-u>Gmerge<CR>
nnoremap Uu :<C-u>Git up<CR>
nmap UU Uu
" }}}
" }}}
" Plugins {{{
" BufferLine {{{
let g:bufferline_echo = 1
let g:bufferline_rotate = 1
let g:bufferline_fname_mod = ':~:.'
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}
" DelimitMate {{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpairs = 1
" }}}
" Unload netrw {{{
let g:loaded_nerwPlugin = 1
" }}}
" Formatting & Cleaning {{{
command! Clean let _s=@/ | %s/\s\+$//e | let @/=_s | set nohlsearch
command! Format norm gg=Gg``
" }}}
" Limelight {{{
let g:limelight_conceal_guifg = 'DarkGray'
" }}}
" Morph {{{
let g:Morph_UserMorphs = expand('~') . '/.config/Morphs.morph'
" }}}
" Neomake {{{
augroup syntax_check
  au!
  autocmd BufEnter,BufWritePost * silent! Neomake
augroup END

let g:neomake_warning_sign = {
      \ 'text': '‼',
      \ 'texthl': 'Warning',
      \ }
" }}}
" TMux {{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

noremap <leader>vl :VimuxRunLastCommand<CR>
noremap <leader>vi :VimuxInspectPanel<CR>
noremap <leader>vq :VimuxCloseRunner<CR>
noremap <leader>vx :VimuxInterruptRunner<CR>
noremap <leader>vz :call VimuxZoomRunner()<CR>
" }}}
" Signify {{{
let g:signify_sign_add = '▌'
let g:signify_sign_delete = '▖'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_change = '▐'
let g:signify_sign_changedelete = '▞'

let g:signify_sign_show_count = 0
" }}}
" }}}
