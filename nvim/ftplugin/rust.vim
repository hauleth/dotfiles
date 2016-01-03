compiler cargo

setl colorcolumn=100

let g:rustfmt_autosave = 1

noremap <leader>rb :up \| call VimuxRunCommand("clear; cargo build")<CR>
noremap <leader>rt :up \| call VimuxRunCommand("clear; cargo test")<CR>
