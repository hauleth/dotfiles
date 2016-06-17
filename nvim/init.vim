" vim: foldmethod=marker foldlevel=0 foldenable

" Plugins {{{
call plug#begin('~/.local/nvim/plugins')

" Visual
Plug 'bling/vim-bufferline'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'dag/vim-fish'
Plug 'hauleth/vim-ketos'
Plug 'slashmili/alchemist.vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File management
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" Time management
Plug 'wakatime/vim-wakatime'

" TMux integration
Plug 'tpope/vim-tbone'
Plug 'christoomey/vim-tmux-navigator'

" Completion
Plug 'mattn/emmet-vim'
Plug 'racer-rust/vim-racer'

" Code manipulation
Plug 'cohama/lexima.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Build & Configuration
Plug 'benekastah/neomake'
Plug 'tpope/vim-projectionist'

" Utils
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mjbrownie/swapit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/Goyo.vim', { 'on': 'Goyo' }

call plug#end()
" }}}
" Colors {{{
set background=dark
colorscheme gruvbox
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

" Set utf8 as standard encoding
set encoding=utf8

" Shorten interruptive command output
set shortmess+=atI

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" Wrap line on movements
set whichwrap+=<,>,[,]

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

set lazyredraw

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
" }}}
" Backup, swap & undo {{{
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set noswapfile

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if !isdirectory($HOME . "/.cache/backups")
  silent !mkdir -p ~/.cache/backups > /dev/null 2>&1
endif
let &undodir=$HOME . "/.cache/backups"
set undofile
set undolevels=1000
set undoreload=10000
" }}}
" Tags {{{
command! UpdateTags call UpdateTags(0, '.')

let g:tagscmd = 'ctags -a'

function! UpdateTags(check, path)
  let l:cwd = getcwd()
  let l:tagsfile = l:cwd . '/tags'

  if a:check && ! filewritable(tagsfile)
    return
  endif

  exec('NeomakeSh ' . g:tagscmd . ' -f ' . tagsfile . ' ' . a:path)
endfunction

augroup ctags
  au!
  au BufWritePost * call UpdateTags(1, @%)
augroup END
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
" ESC {{{
inoremap jk <ESC>
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
nnoremap ZS :xa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>
nnoremap ZB :bd<CR>
" }}}
" Split line at cursor position {{{
nnoremap K i<CR><Esc>k$
nnoremap Q K
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
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <leader>f :<C-u>Files<CR>
nnoremap <leader><leader> :<C-u>Files<CR>
nnoremap <leader>t :<C-u>Tags<CR>
nnoremap <leader>b :<C-u>Buffers<CR>
" }}}
" UndoTree {{{
noremap <F2> :<C-u>UndotreeToggle<CR>
" }}}
" EasyAlign {{{
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
" }}}
" Format {{{
noremap g= gg=Gg``
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
nnoremap Uu :<C-u>Git up<CR>
nnoremap Uf :<C-u>GitFiles<CR>
nnoremap Ul :<C-u>GV<CR>
nnoremap UL :<C-u>GV!<CR>
nmap UU Uu
" }}}
" Tabs {{{
nnoremap <C-w>t :<C-u>tabnew <bar> Dirvish<CR>
" }}}
" Yank to the end of line {{{
nnoremap Y y$
" }}}
" }}}
" Configuration {{{
" Grep {{{
if executable('ag')
  set grepformat^=%f:%l:%c:%m
  set grepprg=ag\ --vimgrep\ --hidden
endif
" }}}
" BufferLine {{{
let g:bufferline_echo = 1
let g:bufferline_rotate = 1
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_fname_mod = ':~:.'
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
  autocmd BufEnter,BufWritePost * silent Neomake
augroup END

let g:neomake_warning_sign = {
      \ 'text': '‼',
      \ 'texthl': 'Warning',
      \ }
" }}}
" MPD {{{
command! -nargs=+ MPD call jobstart(['mpc', <f-args>])
command! MPDAdd call fzf#run({
      \ 'source': 'mpc listall',
      \ 'sink': 'MPD add',
      \ })
" }}}
" TMux {{{
let g:tmux_navigator_save_on_switch = 1
" }}}
" Signify {{{
let g:signify_sign_add = '▌'
let g:signify_sign_delete = '▖'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_change = '▐'
let g:signify_sign_changedelete = '▞'

let g:signify_sign_show_count = 0
" }}}
" Lexima {{{
call lexima#add_rule({'char': '%', 'at': '<\%#', 'input_after': ' %>', 'filetype': ['eelixir', 'eruby']})
" }}}
" Limelight {{{
let g:limelight_conceal_ctermfg = 'lightgray'
let g:limelight_conceal_guifg = '#666666'
" }}}
" }}}
