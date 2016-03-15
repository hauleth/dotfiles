" whirl.vim - vinegar for your dirvish
" Maintainer:   Łukasz Jan Niemier <http://lukasz.niemier.pl>

if exists("g:loaded_whirl") || v:version < 700 || &cp
  finish
endif
let g:loaded_whirl = 1

augroup dirvish_sort
  au!
  au FileType dirvish sort r /[^\/]$/
  au FileType dirvish g/\~$/d
augroup END

if empty(maparg('-', 'n'))
  nnoremap <silent> - :<C-u>Dirvish .<CR>
endif

if empty(maparg('+', 'n'))
  nnoremap <silent> + :<C-u>Dirvish %:p:h<CR>
endif
