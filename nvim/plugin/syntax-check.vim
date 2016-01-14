augroup syntax_chech
  au!
  autocmd BufEnter,BufWritePost * silent! Neomake
augroup END
