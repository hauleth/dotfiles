" vi: foldmethod=marker foldlevel=0
scriptencoding utf-8

" Plugins {{{
command! -bar PackUpdate  call plugins#reload() | call minpac#update()
command! -bar PackClean   call plugins#reload() | call minpac#clean()
command! -bar PackStatus  call plugins#reload() | call minpac#status()
" }}}
" User interface {{{
" Ignore all automatic files and folders {{{
set wildignore+=*.o,*~,**/.git/**,**/tmp/**,**/node_modules/**,**/_build/**,**/deps/**,**/target/**,**/uploads/**
" }}}
" Hypen is part of the keyword, if you want to substract then add spaces {{{
set iskeyword+=-
" }}}
" }}}
" Diff options {{{
set diffopt+=indent-heuristic,algorithm:patience
" }}}
" Custom configurations {{{
" Fuzzy file search {{{
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden --glob !.git'

let g:clap#provider#files# = {
      \ 'source': 'rg --files --hidden --glob !.git',
      \ 'sink*': function('clap#provider#files#sink_star_impl'),
      \ 'sink': function('clap#provider#files#sink_impl'),
      \ 'support_open_action': v:true,
      \ 'enable_rooter': v:true,
      \ 'syntax': 'clap_files',
      \ 'on_move': function('clap#provider#files#on_move_impl')
      \ }
" }}}
" Asynchronous commands {{{
command! -bang -nargs=* -complete=file Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* -complete=dir Grep call asyncdo#run(<bang>0,
            \ { 'job': &grepprg, 'errorformat': &grepformat },
            \ <f-args>)
command! -bang -nargs=* -complete=file LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* -complete=dir LGrep call asyncdo#lrun(<bang>0, { 'job': &grepprg, 'errorformat': &grepformat }, <f-args>)
" }}}
" Format {{{
command! Clean keeppatterns %s/\s\+$//e | set nohlsearch
" }}}
" Terminal {{{
if executable('nvr')
    let $EDITOR = 'nvr -cc split -c "set bufhidden=delete" --remote-wait'
endif
" }}}
" Startify {{{
let g:startify_lists = [
      \ {'type': 'sessions', 'header': ['   Sessions']},
      \ {'type': 'commands', 'header': ['   Wiki']},
      \ ]
let g:startify_session_dir = '~/.local/share/nvim/site/sessions/'
let g:startify_session_autoload = v:true
let g:startify_session_persistence = v:true

let g:startify_commands = [
      \ {'w': ['Wiki', 'VimwikiIndex']},
      \ {'d': ['Diary', 'VimwikiDiaryIndex']},
      \ {'t': ['Today', 'VimwikiMakeDiaryNote']},
      \ {'y': ['Yesterday', 'VimwikiMakeYesterdayDiaryNote']},
      \ {'a': ['Tomorrow', 'VimwikiMakeTomorrowDiaryNote']},
      \ ]

let g:startify_change_to_dir = v:false
let g:startify_change_to_vcs_root = v:true
let g:startify_fortune_use_unicode = v:true
" }}}
" }}}
" Completions {{{
set tags^=./**/tags
" }}}

" Needed for Projectionist and dadbod
command! -nargs=* Start <mods> split new <bar> call termopen(<q-args>) <bar> startinsert
command! -nargs=0 Ctags AsyncDo ctags -R
command! -nargs=? Dash call dash#open(<f-args>)
command! Term <mods> split +term <bar> startinsert

command! Bd b#|bd#

packadd! vim-sandwich
runtime macros/sandwich/keymap/surround.vim
