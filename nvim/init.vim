" vi: foldmethod=marker foldlevel=0
scriptencoding utf-8

" Plugins {{{
let g:loaded_netrwPlugin = 1

command! -bar PackUpdate call plugins#reload() | call minpac#update()
command! -bar PackClean  call plugins#reload() | call minpac#clean()

set runtimepath^=/usr/local/opt/fzf/
set packpath^=~/.local/share/nvim
" }}}
" Identation {{{
set shiftwidth=4 expandtab

set textwidth=80
set nowrap linebreak formatoptions+=l
" }}}
" User interface {{{
set lazyredraw

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
nnoremap UB :<C-u>Gblame<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Uu :<C-u>Gpull<CR>
nnoremap Ug :<C-u>Glog<CR>
nmap     UU Uu

cabbrev G  Git
cabbrev G! Git!
" }}}
" Asynchronous commands {{{
command! -bang -nargs=* Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* -complete=dir Grep call asyncdo#run(<bang>0, { 'job': &grepprg, 'errorformat': &grepformat }, <f-args>)
command! -bang -nargs=* LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>)
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
" Scratchpad {{{
command! Scratchify setlocal nobuflisted noswapfile buftype=nofile bufhidden=delete
command! Scratch  enew   |Scratchify
command! SScratch new    +Scratchify
command! VScratch vnew   +Scratchify
command! TScratch tabnew +Scratchify
" }}}
" Format {{{
nnoremap g= gg=Gg``
noremap  Q  gq
nnoremap gQ gggqG``

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
let g:startify_session_dir = '~/.local/share/nvim/sessions/'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
" }}}
" HighlihtedYank {{{
let g:highlightedyank_highlight_duration = 200
" }}}
" }}}
" Completions {{{
set complete=.,w,b,t,k,kspell
set completeopt=menuone,noselect,noinsert

" Set username for PT plugin
let g:pivotaltracker_name = 'hauleth'

let g:lsp_async_completion = v:true
let g:echodoc_enable_at_startup = v:true

let g:usnip_dirs = ['~/.config/nvim/snips']

augroup lsp_servers_setup
    au!
    au User lsp_setup call completion#lsp()
augroup END
" }}}
" Reload $MYVIMRC on save {{{
augroup autoreload_config
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | e!
augroup END
" }}}

" Needed for Projectionist and dadbod
command! -nargs=* Start <mods> split term://<args>
command! -nargs=? Dash call dash#open(<f-args>)

nnoremap gK :Dash<CR>

" Load custom configuration for given machine
runtime custom.vim
