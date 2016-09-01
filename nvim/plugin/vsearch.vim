" vsearch.vim - simplify visual search
" Maintainer:   Łukasz Niemier <lukasz@niemier.pl>

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

xmap gs <Plug>(vsearch-change-selected-forward)
xmap gS <Plug>(vsearch-change-selected-backward)
