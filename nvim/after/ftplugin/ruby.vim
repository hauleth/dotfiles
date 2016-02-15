noremap <F12> :!ripper-tags -f .tags -R . --exclude vendor<CR>

imap ,, =>
" noremap <buffer> g= :RubocopFmt<CR>

command! RubocopFmt update | NeomakeSh rubocop -a %

noremap <leader>rb :up<bar>call VimuxRunCommand("clear; cargo bench")<CR>
noremap <leader>rr :up<bar>call VimuxRunCommand("clear; cargo test")<CR>
