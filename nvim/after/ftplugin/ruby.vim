augroup format
  au!
  au BufWritePost *.rb :RubocopFmt
augroup END

command! RubocopFmt NeomakeSh rubocop -la %

noremap <leader>rb :up<bar>call VimuxRunCommand("clear; cargo bench")<CR>
noremap <leader>rr :up<bar>call VimuxRunCommand("clear; cargo test")<CR>
