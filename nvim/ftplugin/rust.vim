compiler cargo

setl colorcolumn=100

noremap <leader>rb :call VimuxRunCommand("clear; cargo build")<CR>
noremap <leader>rt :call VimuxRunCommand("clear; cargo test")<CR>

au BufWrite rust :Autoformat
au BufWrite rust :silent !ctags -R .
