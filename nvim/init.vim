" vi: foldmethod=marker
scriptencoding utf-8

" Unload unneeded plugins {{{
let g:loaded_netrw         = 1
let g:loaded_netrwPlugin   = 1
let g:loaded_vimballPlugin = 1
" }}}

" Plugins {{{
command! -bar PackUpdate call plugins#reload() | call minpac#update()
command! -bar PackClean  call plugins#reload() | call minpac#clean()

set packpath^=~/.local/share/nvim
" }}}
" Identation {{{
set tabstop=4 shiftwidth=0 softtabstop=-1 expandtab

set textwidth=80
set nowrap linebreak formatoptions+=l
" }}}
" User interface {{{
set lazyredraw

" Ignore case. If your code uses different casing to differentiate files, then
" you need mental help
set wildignorecase fileignorecase
" Colors {{{
set termguicolors
colorscheme blame
" }}}
" Ignore all automatic files and folders {{{
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*
" }}}
" Display tabs and trailing spaces visually {{{
set list listchars=tab:→\ ,trail:·,nbsp:␣
set conceallevel=2
" }}}
" Do not show current mode down the bottom {{{
set noshowmode
" }}}
" Autowrite files when possible {{{
set nohidden autowriteall
" }}}
" Wrap line on movements {{{
set whichwrap+=[,]
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
let &colorcolumn = &textwidth + 1
" }}}
" Split in CORRECT places {{{
set splitright splitbelow
" }}}
" Statusline {{{
let &laststatus  = 2
let &statusline  = ''
let &statusline .= ' '
let &statusline .= '» %f%{statusline#modified()} «%<'
let &statusline .= '%='
let &statusline .= '%{statusline#repo()}'
let &statusline .= ' '
let &statusline .= '%{statusline#quickfix()}%4c:%l'
let &statusline .= ' '
" }}}
" }}}
" Search {{{
" Smart case searches
set ignorecase smartcase inccommand=nosplit
" }}}
" Permanent undo {{{
set undofile
" }}}
" Custom configurations {{{
let g:vue_disable_pre_processors = 1
" Fuzzy file search {{{
nnoremap <Space><Space> :<C-u>SK<CR>
" }}}
" Git shortcuts {{{
nnoremap U  <nop>
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
cabbr Git Gina
cabbr Git! Gina!
" }}}
" Asynchronous commands {{{
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
command! -bang -nargs=* -complete=file Grep AsyncRun -program=grep @ <args>
" }}}
" Expand abbreviations on enter {{{
inoremap <CR> <C-]><CR>
" }}}
" Smart `^` {{{
" `^` goes to the beginning of the text on first press and to the beginning
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
nnoremap : ;
vnoremap : ;
nnoremap q; q:
" }}}
" Fix idiotic vim defaults {{{
nnoremap Y y$
" }}}
" Folding {{{
nnoremap <expr> <CR> foldlevel('.')?'za':"\<CR>"
" }}}
" Scratchpad {{{
command! Scratchify setlocal nobuflisted buftype=nofile bufhidden=delete
command! Scratch enew | Scratchify
command! SScratch split | Scratchify
command! VScratch vsplit | Scratchify
" }}}
" Format {{{
nnoremap g= gg=Gg``
noremap  Q  gq
nnoremap gQ gggqG``

command! Clean let _s = @/ | %s/\s\+$//e | let @/ = _s | set nohlsearch
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
if has('nvim')
    nnoremap <C-q> <nop>
    nnoremap <C-q>c :<C-u>term<CR>
    nnoremap <C-q>s :<C-u>split +term<CR>
    nnoremap <C-q>v :<C-u>vsplit +term<CR>
    nnoremap <C-q>t :<C-u>tabnew +term<CR>

    tnoremap <C-q> <C-\><C-n>

    if executable('nvr')
        let $EDITOR = 'nvr -cc split -c "set bufhidden=delete" --remote-wait'
    endif
endif
" }}}
" Auto align windows {{{
augroup align_windows
    au!
    autocmd VimResized * wincmd =
augroup END
" }}}
" Startify {{{
let g:startify_list_order = ['sessions', 'dir']
let g:startify_session_dir = '~/.local/share/nvim/sessions/'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
" }}}
" }}}
