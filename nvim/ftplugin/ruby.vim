noremap <F12> :!ripper-tags -f .tags -R . --exclude vendor<CR>

imap ,, =>

let g:syntastic_ruby_checkers = ['rubocop', 'jruby', 'mri']
