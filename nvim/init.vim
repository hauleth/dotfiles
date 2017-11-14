" vi: foldmethod=marker
scriptencoding utf-8

" Plugins {{{
command! -bar PackUpdate call plugins#reload() | call minpac#update()
command! -bar PackClean  call plugins#reload() | call minpac#clean()

set packpath^=~/.local/share/nvim

packadd! vim-matchup

" Unload unneeded plugins {{{
let g:loaded_netrwPlugin   = 1 "$VIMRUNTIME/plugin/netrwPlugin.vim
let g:loaded_2html_plugin  = 1 "$VIMRUNTIME/plugin/tohtml.vim
" }}}
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
set wildignore+=*.o,*~,*/.git,*/tmp,*/node_modules,*/_build,*/deps,*/target
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
" Statusline {{{
let &laststatus  = 2
let &statusline  = ''
let &statusline .= ' '
let &statusline .= '» %f%{statusline#modified()} «%<'
let &statusline .= '%='
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
" Fuzzy file search {{{
nnoremap <Space><Space> :<C-u>Files<CR>
" }}}
" Git shortcuts {{{
nnoremap U  <nop>
nnoremap Up :<C-u>Gpush<CR>
nnoremap Us :<C-u>Gstatus<CR>
nnoremap Ud :<C-u>Gdiff<CR>
nnoremap Ub :<C-u>Merginal<CR>
nnoremap UB :<C-u>Gblame<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Uu :<C-u>Gpull<CR>
nmap     UU Uu

cabbrev G  Git
cabbrev G! Git!
" }}}
" Asynchronous commands {{{
command! -bang -nargs=* Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* Grep call asyncdo#run(<bang>0, &grepprg, <f-args>)
command! -bang -nargs=* LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* LGrep call asyncdo#lrun(<bang>0, &grepprg, <f-args>)
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
vnoremap ; :
nnoremap : ;
vnoremap : ;
nnoremap q; q:
" }}}
" Fix idiotic vim defaults {{{
nnoremap Y y$
" }}}
" Folding {{{
nnoremap <expr> <CR> foldlevel('.') ? 'za' : "\<CR>"
" }}}
" Scratchpad {{{
command! Scratchify setlocal nobuflisted buftype=nofile bufhidden=delete
command! Scratch  enew   | Scratchify
command! SScratch new    | Scratchify
command! VScratch vnew   | Scratchify
command! TScratch tabnew | Scratchify
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
nmap <C-q> <Esc>
nnoremap <C-q>c :<C-u>term<CR>
nnoremap <C-q>s :<C-u>split +term<CR>
nnoremap <C-q>v :<C-u>vsplit +term<CR>
nnoremap <C-q>t :<C-u>tabnew +term<CR>

tnoremap <C-q> <C-\><C-n>

if executable('nvr')
    let $EDITOR = 'nvr -cc split -c "set bufhidden=delete" --remote-wait'
endif

augroup terminal_config
    au!
    au TermOpen * setlocal scrolloff=0
augroup END
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
" Match up {{{
let g:matchup_matchparen_status_offscreen = 0
" }}}
" }}}
" Completions {{{
" let g:asyncomplete_completion_delay = 500

augroup asyncomplete_register_sources
    au!
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                \ 'name': 'omni',
                \ 'whitelist': ['*'],
                \ 'blacklist': ['html', 'html.javascript'],
                \ 'completor': function('asyncomplete#sources#omni#completor')
                \  }))
    autocmd User asyncomplete_setup call asyncomplete#register_source(
                \ asyncomplete#sources#racer#get_source_options())
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
                \ 'name': 'necovim',
                \ 'whitelist': ['vim'],
                \ 'completor': function('asyncomplete#sources#necovim#completor'),
                \ }))
augroup END
" }}}
