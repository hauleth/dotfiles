" vsearch.vim - simplify visual search
" Maintainer:   Łukasz Niemier <http://lukasz.niemier.pl>

if exists("g:loaded_whirl") || v:version < 700 || &cp
  finish
endif
let g:loaded_whirl = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = temp
endfunction

xnoremap <Plug>(vsearch-search-selected-forward) :<C-u>call <SID>VSetSearch()<CR>/<CR>
xnoremap <Plug>(vsearch-search-selected-backward) :<C-u>call <SID>VSetSearch()<CR>?<CR>

xnoremap <Plug>(vsearch-change-selected-forward) :<C-u>call <SID>VSetSearch()<CR>:set hlsearch<CR>cgn
xnoremap <Plug>(vsearch-change-selected-backward) :<C-u>call <SID>VSetSearch()<CR>:set hlsearch<CR>cgN

xmap * <Plug>(vsearch-search-selected-forward)
xmap # <Plug>(vsearch-search-selected-backward)

xmap s <Plug>(vsearch-change-selected-forward)
xmap S <Plug>(vsearch-change-selected-backward)

let &cpo = s:save_cpo
