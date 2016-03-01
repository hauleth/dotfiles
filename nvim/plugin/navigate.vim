map <M-Left> <C-T>
map <M-Right> <C-]>

set tags+=.tags
augroup ctags
  au!
  au BufWritePost * :NeomakeSh ctags -R .
augroup END
