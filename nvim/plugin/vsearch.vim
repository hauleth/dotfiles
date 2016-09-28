" vsearch.vim - simplify visual search
" Maintainer:   Łukasz Niemier <http://lukasz.niemier.pl>

if exists("g:loaded_whirl") || v:version < 700 || &cp
  finish
endif
let g:loaded_whirl = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:VSetSearch(type, ...)
  let temp = @@
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif

  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = temp
endfunction

nnoremap <Plug>(vsearch-change-motion-forward) :<C-u>set opfunc=<SID>VSetSearch<CR>g@

xnoremap <Plug>(vsearch-search-selected-forward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>/<CR>
xnoremap <Plug>(vsearch-search-selected-backward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>?<CR>

xnoremap <Plug>(vsearch-change-selected-forward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>:set hlsearch<CR>cgn
xnoremap <Plug>(vsearch-change-selected-backward) :<C-u>call <SID>VSetSearch(visualmode(), 1)<CR>:set hlsearch<CR>cgN

nmap s <Plug>(vsearch-change-motion-forward)

xmap * <Plug>(vsearch-search-selected-forward)
xmap # <Plug>(vsearch-search-selected-backward)

xmap s <Plug>(vsearch-change-selected-forward)
xmap S <Plug>(vsearch-change-selected-backward)

let &cpo = s:save_cpo
