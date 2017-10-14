" vi: foldmethod=marker
scriptencoding utf-8

" Unload unneeded plugins {{{
let g:loaded_netrw         = 1
let g:loaded_netrwPlugin   = 1
let g:loaded_vimballPlugin = 1
" }}}

" Plugins {{{
set packpath^=~/.local/share/nvim
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

call minpac#add('hauleth/blame.vim')

call minpac#add('mhinz/vim-startify')

" Leader {{{
call minpac#add('hecal3/vim-leader-guide')
nnoremap <silent> <Space> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <Space> :<c-u>LeaderGuideVisual '<Space>'<CR>
" }}}

" Languages
call minpac#add('rust-lang/rust.vim')
call minpac#add('dag/vim-fish')
call minpac#add('cespare/vim-toml')
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('hashivim/vim-hashicorp-tools')
call minpac#add('posva/vim-vue')

call minpac#add('lambdalisue/gina.vim')
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
call minpac#add('lotabout/skim', { 'do': '!./install --bin' })
nnoremap <Space><Space> :<C-u>SK<CR>
call minpac#add('tpope/vim-projectionist')
call minpac#add('direnv/direnv.vim')

" File management
call minpac#add('justinmk/vim-dirvish')
call minpac#add('tpope/vim-eunuch')

" Completion
call minpac#add('racer-rust/vim-racer')
call minpac#add('slashmili/alchemist.vim')
call minpac#add('roxma/nvim-completion-manager')
call minpac#add('roxma/nvim-cm-racer')

" Code manipulation
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('tommcdo/vim-exchange')
call minpac#add('tommcdo/vim-lion')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-surround')
call minpac#add('AndrewRadev/splitjoin.vim')

call minpac#add('hauleth/sad.vim')

nmap c <Plug>(sad-change-forward)
vmap c <Plug>(sad-change-forward)
nmap C <Plug>(sad-change-forward)$
nnoremap cc cc
nnoremap <Space>c c
nnoremap <Space>C C
vnoremap <Space>c c

" Build & Configuration
call minpac#add('skywind3000/asyncrun.vim')
call minpac#add('romainl/vim-qf')
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" Utils
call minpac#add('wellle/targets.vim')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-unimpaired')
" }}}
" Identation {{{
set tabstop=4 shiftwidth=0  softtabstop=-1 expandtab

set textwidth=80
set nowrap       " Don't wrap lines
set linebreak    " Break lines at convenient points
set formatoptions+=l
" }}}
" Colors {{{
set termguicolors
colorscheme blame
" }}}
" User interface {{{
" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

" Display tabs and trailing spaces visually
set list listchars=tab:→\ ,trail:·,nbsp:␣
set conceallevel=2

" Do not show current mode down the bottom
set noshowmode

" Autowrite files when possible
set nohidden autowriteall

" Wrap line on movements
set whichwrap+=[,]

" Keep cursor in the middle
set scrolloff=9999

set mouse=a

" Hypen is part of the keyword, if you want to substract then add spaces
set iskeyword+=-

" Show 80 column
let &colorcolumn = &textwidth + 1

set splitright splitbelow

" Diff in vertical splits and ignore whitespaces
set diffopt+=vertical,iwhite

let &laststatus = 2
let &statusline = "%<%2n » %f%{&modified ? ' +' : ''} «%=%4c:%l"
" }}}
" Search {{{
" Smart case searches
set ignorecase smartcase inccommand=nosplit
" }}}
" Backup, swap & undo {{{
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup noswapfile

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
" Fix idiotic vim defaults {{{
nnoremap Y y$
" }}}
" Folding {{{
nnoremap <expr> <CR> foldlevel('.')?'za':"\<CR>"
" }}}
" Format {{{
nnoremap g= gg=Gg``
noremap  Q gq
nnoremap gQ gggqG``
" }}}
" Search {{{
" Easier change and replace word
nnoremap <Space>, :nohlsearch<CR>
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

command! Note setlocal nobuflisted buftype=nofile bufhidden=delete

let g:sql_type_default = 'pgsql'
" }}}
