" vi: foldmethod=marker
scriptencoding utf-8

" Plugins {{{
" Unload unneeded plugins {{{
let g:loaded_netrwPlugin   = 1 "$VIMRUNTIME/plugin/netrwPlugin.vim
let g:loaded_2html_plugin  = 1 "$VIMRUNTIME/plugin/tohtml.vim
" }}}
command! -bar PackUpdate call plugins#reload() | call minpac#update()
command! -bar PackClean  call plugins#reload() | call minpac#clean()

set rtp+=/usr/local/opt/fzf
set packpath^=~/.local/share/nvim
" }}}
" Identation {{{
set tabstop=4 shiftwidth=0 expandtab

set textwidth=80
set nowrap linebreak formatoptions+=l
" }}}
" User interface {{{
" set lazyredraw

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
" Statusline {{{
let &statusline  = ''
let &statusline .= ' '
let &statusline .= '» %f%{statusline#modified()} «%<'
let &statusline .= '%='
let &statusline .= '%{statusline#quickfix()} %4c:%l'
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
nnoremap <Space><Space> :<C-u>FZF<CR>
" }}}
" Git shortcuts {{{
nnoremap U  <nop>
nnoremap Up :<C-u>Gina push<CR>
nnoremap Us :<C-u>Gina status -s<CR>
nnoremap Ud :<C-u>Gina diff<CR>
nnoremap Ub :<C-u>Gina branch<CR>
nnoremap UB :<C-u>Gina blame<CR>
nnoremap Uc :<C-u>Gina commit<CR>
nnoremap Uu :<C-u>Gina pull<CR>
nnoremap Ug :<C-u>Gina log --graph<CR>
nmap     UU Uu

cabbrev G  Gina
cabbrev G! Gina!
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
" HighlihtedYank {{{
let g:highlightedyank_highlight_duration = 200
" }}}
" Snipe f/F/t/T {{{
" let g:snipe_jump_tokens = 'asdfghklqwertyuiopzxcvbnm'
let g:snipe_jump_tokens = 'fhghdjskal'

nmap F <Plug>(snipe-F)
nmap f <Plug>(snipe-f)
nmap T <Plug>(snipe-T)
nmap t <Plug>(snipe-t)
" }}}
" }}}
" Completions {{{
set complete=.,w,b,t,u
set completeopt=menu,longest,noselect
let g:echodoc_enable_at_startup = 1
let g:cpty_awk_cmd = 'mawk -f'

let g:lsp_servers = [
            \ {
            \   'name': 'elixir-ls',
            \   'cmd': {server_info->[&shell, &shellcmdflag, 'env ERL_LIBS=/Users/hauleth/Workspace/JakeBecker/elixir-ls/lsp mix elixir_ls.language_server']},
            \   'whitelist': ['elixir'],
            \ },
            \ {
            \   'name': 'rls',
            \   'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
            \   'whitelist': ['rust'],
            \ },
            \ {
            \   'name': 'vue-language-server',
            \   'cmd': {server_info->['vls']},
            \   'whitelist': ['vue'],
            \ }
            \ ]

augroup lsp_servers
    au!
    au User lsp_setup call completion#lsp()
augroup END
" }}}

nnoremap zS :echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<'
            \ . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<'
            \ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'<CR>
