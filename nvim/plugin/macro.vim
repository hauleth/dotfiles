nnoremap <silent> @R :set operatorfunc=macro#repeat<CR>g@
xnoremap <silent> @ :<C-u>call macro#repeat()<CR>
function! macro#repeat(...)
  execute (a:0 ? "'[,']" : "'<,'>").'normal @'.nr2char(getchar())
endfunction
