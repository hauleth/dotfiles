compiler cargo

let g:rustfmt_autosave = 1

setl colorcolumn=100

noremap <leader>rb :up \| call VimuxRunCommand("clear; cargo build")<CR>
noremap <leader>rt :up \| call VimuxRunCommand("clear; cargo test")<CR>

au! BufWritePost *.rs silent !ctags -R .
