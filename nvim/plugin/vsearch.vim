" vsearch.vim - simplify visual search
" Maintainer:   Łukasz Niemier <http://lukasz.niemier.pl>

scriptencoding utf-8

if exists('g:loaded_vsearch') || v:version < 700 || &cp
  finish
endif
let g:loaded_vsearch = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:VSetSearch(type, ...)
  let l:temp = @@
  if a:0
    silent exe 'norm! gvy'
  elseif a:type ==# 'line'
    silent exe "normal! '[V']y"
  else
    silent exe 'normal! `[v`]y'
  endif

  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = l:temp
endfunction

function! s:VSearchAndReplaceFw(type, ...)
  let l:temp = @@
  if a:0
    silent exe 'norm! gvy'
  elseif a:type ==# 'line'
    silent exe "normal! '[V']y"
  else
    silent exe 'normal! `[v`]y'
  endif

  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  call feedkeys('cgn', 'n')
  let @@ = l:temp
endfunction

function! s:VSearchAndReplaceBc(type, ...)
  let l:temp = @@
  if a:0
    silent exe 'norm! gvy'
  elseif a:type ==# 'line'
    silent exe "normal! '[V']y"
  else
    silent exe 'normal! `[v`]y'
  endif

  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  call feedkeys('cgN', 'n')
  let @@ = l:temp
endfunction

xnoremap <Plug>(vsearch-search-selected-forward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>/<CR>
xnoremap <Plug>(vsearch-search-selected-backward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>?<CR>

xnoremap <Plug>(vsearch-change-selected-forward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>:set hlsearch<CR>cgn
xnoremap <Plug>(vsearch-change-selected-backward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>:set hlsearch<CR>cgN

nnoremap <Plug>(vsearch-change-word-forward) :set operatorfunc=<SID>VSearchAndReplaceFw<CR>g@
nnoremap <Plug>(vsearch-change-word-backward) :set operatorfunc=<SID>VSearchAndReplaceBc<CR>g@

xmap * <Plug>(vsearch-search-selected-forward)
xmap # <Plug>(vsearch-search-selected-backward)

xmap s <Plug>(vsearch-change-selected-forward)
xmap S <Plug>(vsearch-change-selected-backward)

nmap s <Plug>(vsearch-change-word-forward)
nmap S <Plug>(vsearch-change-word-backward)

let &cpo = s:save_cpo
