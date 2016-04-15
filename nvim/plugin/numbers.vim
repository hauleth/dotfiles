" Line numbers are good
augroup numbers
  au BufEnter,WinEnter * set number
  au BufEnter,WinEnter * set relativenumber
  au BufLeave,WinLeave * set nonumber
  au BufLeave,WinLeave * set norelativenumber
augroup END
