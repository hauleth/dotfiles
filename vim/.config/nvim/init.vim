" vi: foldmethod=marker foldlevel=0
scriptencoding utf-8

if exists('$IN_NIX_SHELL')
    set shell=fish
endif

" Plugins {{{
let g:loaded_netrwPlugin = 1

command! -bar PackInstall call plugins#reload() | call packager#install()
command! -bar PackUpdate  call plugins#reload() | call packager#update()
command! -bar PackClean   call plugins#reload() | call packager#clean()
command! -bar PackStatus  call plugins#reload() | call packager#status()

set runtimepath^=/usr/local/opt/fzf/
" }}}
" Identation {{{
set shiftwidth=4 expandtab

set textwidth=80
set nowrap linebreak formatoptions+=l
" }}}
" User interface {{{
set lazyredraw

set updatetime=500

set title

" Ignore case. If your code uses different casing to differentiate files, then
" you need mental help
set wildignorecase fileignorecase
set wildmode=full
" Colors {{{
set termguicolors
" set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
colorscheme blame
" }}}
" Ignore all automatic files and folders {{{
set wildignore+=*.o,*~,**/.git/**,**/tmp/**,**/node_modules/**,**/_build/**,**/deps/**,**/target/**,**/uploads/**
" }}}
" Display tabs and trailing spaces visually {{{
set fillchars=vert:┃,fold:·
set list listchars=tab:→\ ,trail:·,nbsp:␣,extends:↦,precedes:↤
set conceallevel=2
" }}}
" Do not show current mode down the bottom {{{
set noshowmode
" }}}
" Autowrite files when possible {{{
set nohidden autowriteall
" }}}
" Keep cursor in the middle {{{
set scrolloff=9999
" }}}
" Enable mouse suport {{{
set mouse=a
" }}}
" Hypen is part of the keyword, if you want to substract then add spaces {{{
set iskeyword+=-
" }}}
" Show 80 column {{{
set colorcolumn=+1
" }}}
" Split in CORRECT places {{{
set splitright splitbelow
" }}}
" }}}
" Diff options {{{
set diffopt-=internal
set diffopt+=indent-heuristic,algorithm:patience
" }}}
" Search {{{
" Smart case searches
set ignorecase smartcase

if exists('+inccommand')
    set inccommand=nosplit
end
" }}}
" Permanent undo {{{
set undofile
" }}}
" Custom configurations {{{
" Fuzzy file search {{{
nnoremap <Space><Space> :<C-u>FZF<CR>

set path=,,
" }}}
" Git shortcuts {{{
nnoremap U  <nop>
nnoremap Up :<C-u>Gpush<CR>
nnoremap Us :<C-u>Gstatus<CR>
nnoremap Ud :<C-u>Gdiff<CR>
nnoremap Ub :<C-u>MerginalToggle<CR>
nnoremap UB :<C-u>Start tig blame %<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Uu :<C-u>Gpull<CR>
nnoremap Ug :<C-u>Glog<CR>
nmap     UU Uu

cabbrev G  Git
cabbrev G! Git!
" }}}
" Asynchronous commands {{{
command! -bang -nargs=* -complete=file Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* -complete=dir Grep call asyncdo#run(<bang>0,
            \ { 'job': &grepprg, 'errorformat': &grepformat },
            \ <f-args>)
command! -bang -nargs=* -complete=file LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* -complete=dir LGrep call asyncdo#lrun(<bang>0, { 'job': &grepprg, 'errorformat': &grepformat }, <f-args>)
" }}}
" Expand abbreviations on enter {{{
inoremap <CR> <C-]><CR>
" }}}
" Smart `0` {{{
" `0` goes to the beginning of the text on first press and to the beginning
" of the line on second press. It alternates afterwards.
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
" }}}
" File closing {{{
nnoremap ZS :wa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>
" }}}
" Simplify switching to Command mode {{{
nnoremap ; :
xnoremap ; :
nnoremap : ;
xnoremap : ;
nnoremap q; q:
" }}}
" Fix idiotic vim defaults {{{
nnoremap Y y$
" }}}
" Folding {{{
set foldmethod=syntax
set foldlevel=999

nnoremap <expr> <CR> foldlevel('.') ? 'za' : "\<CR>"
" }}}
" Format {{{
nnoremap g= =aGg``
noremap  Q  gq
nnoremap gQ gqaG``

command! Clean keeppatterns %s/\s\+$//e | set nohlsearch
" }}}
" Search {{{
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

" Quickly disable highligh
nnoremap <Space>, :nohlsearch<CR>
" }}}
" Tabs {{{
nnoremap ]w gt
nnoremap [w gT
" }}}
" Terminal {{{
nnoremap <C-q> <Nop>
nnoremap <C-q>c :<C-u>term<CR>
nnoremap <C-q>s :<C-u>split +term<CR>
nnoremap <C-q>v :<C-u>vsplit +term<CR>
nnoremap <C-q>t :<C-u>tabnew +term<CR>

tnoremap <C-q> <C-\><C-n>
inoremap <C-q> <ESC>

if executable('nvr')
    let $EDITOR = 'nvr -cc split -c "set bufhidden=delete" --remote-wait'
endif
" }}}
" Split management {{{
augroup align_windows
    au!
    au VimResized * wincmd =
augroup END

nmap <C-w>q <plug>(choosewin)
nmap <C-_> <plug>(choosewin)
" }}}
" Startify {{{
let g:startify_list_order = ['sessions', 'dir']
let g:startify_session_dir = '~/.local/share/nvim/site/sessions/'
let g:startify_session_autoload = v:true
let g:startify_session_persistence = v:true

let g:startify_change_to_dir = v:false
let g:startify_change_to_vcs_root = v:true
let g:startify_fortune_use_unicode = v:true
" }}}
" }}}
" Completions {{{
set complete=.,w,b,t,k,kspell
set completeopt=menuone,noselect,noinsert

let g:echodoc#enable_at_startup = v:true
let g:echodoc#type = 'virtual'
" }}}

set sessionoptions-=help

if executable('direnv')
    augroup autoreload_envrc
        autocmd!
        autocmd BufWritePost .envrc silent !direnv allow %
    augroup END
endif

" Needed for Projectionist and dadbod
command! -nargs=* Start <mods> split new <bar> call termopen(<q-args>) <bar> startinsert
command! -nargs=0 Ctags AsyncDo ctags -R
command! -nargs=? Dash call dash#open(<f-args>)

nnoremap gK :Dash<CR>

onoremap aG :<C-u>normal! ggVG<CR>

command! Bd b#|bd#

packadd! vim-sandwich
runtime macros/sandwich/keymap/surround.vim

" Load custom configuration for given machine
runtime custom.vim
