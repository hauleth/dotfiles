noremap <F12> :!ripper-tags -f .tags -R . --exclude vendor<CR>

imap ,, =>
noremap <buffer> g= :RubocopFmt<CR>

command! RubocopFmt !rubocop -a %
