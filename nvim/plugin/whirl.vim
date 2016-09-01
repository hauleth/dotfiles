" whirl.vim - vinegar for your dirvish
" Maintainer:   Łukasz Jan Niemier <http://lukasz.niemier.pl>

if exists("g:loaded_whirl") || v:version < 700 || &cp
  finish
endif
let g:loaded_whirl = 1
let s:save_cpo = &cpo
set cpo&vim

augroup dirvish_sort
  au!
  au FileType dirvish sort r /[^\/]$/
augroup END

if mapcheck('+', 'n') ==# ''
  nnoremap <silent> + :<C-U>Dirvish<CR>
endif

let &cpo = s:save_cpo
