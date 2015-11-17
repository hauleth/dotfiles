compiler cargo

setl colorcolumn=100

noremap <leader>rb :wa \| call VimuxRunCommand("clear; cargo build")<CR>
noremap <leader>rt :wa \| call VimuxRunCommand("clear; cargo test")<CR>

au! BufWritePre  *.rs silent Autoformat
au! BufWritePost *.rs silent !ctags -R .
