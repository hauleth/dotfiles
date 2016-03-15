" Map gh to hide "hidden" files.
nnoremap <silent> <buffer> gh
      \ :g@\v/\.[^\/]+/?$@d <bar> set nohlsearch<CR>
