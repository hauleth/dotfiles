augroup ctags
  au!
  au BufWritePost * :NeomakeSh ripper-tags -f .tags -R . --exclude vendor
augroup END

augroup format
  au!
  au BufWritePost * :RubocopFmt
augroup END

command! RubocopFmt NeomakeSh rubocop -la %

noremap <leader>rb :up<bar>call VimuxRunCommand("clear; cargo bench")<CR>
noremap <leader>rr :up<bar>call VimuxRunCommand("clear; cargo test")<CR>
