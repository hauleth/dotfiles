augroup syntax_check
  au!
  autocmd BufEnter,BufWritePost * silent! Neomake
augroup END

let g:neomake_warning_sign = {
      \ 'text': '‼',
      \ 'texthl': 'Warning',
      \ }
