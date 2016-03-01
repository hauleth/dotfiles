compiler cargo
nnoremap <buffer> g= :RustFmt<CR>

let g:rustfmt_autosave = 1

let g:neomake_rust_cargo_maker = {
      \ 'append_file': 0,
      \ 'args': ['check'],
      \ 'errorformat':
      \   '%-G%f:%s:,' .
      \   '%f:%l:%c: %trror: %m,' .
      \   '%f:%l:%c: %tarning: %m,' .
      \   '%f:%l:%c: %m,'.
      \   '%f:%l: %trror: %m,'.
      \   '%f:%l: %tarning: %m,'.
      \   '%f:%l: %m',
      \ }


let g:neomake_rust_rustc_maker = {
      \ 'args': ['-Z', 'parse-only'],
      \ 'errorformat':
      \   '%-G%f:%s:,' .
      \   '%f:%l:%c: %trror: %m,' .
      \   '%f:%l:%c: %tarning: %m,' .
      \   '%f:%l:%c: %m,'.
      \   '%f:%l: %trror: %m,'.
      \   '%f:%l: %tarning: %m,'.
      \   '%f:%l: %m',
      \ }

noremap <leader>rb :up<bar>call VimuxRunCommand("clear; cargo bench")<CR>
noremap <leader>rr :up<bar>call VimuxRunCommand("clear; cargo test")<CR>
