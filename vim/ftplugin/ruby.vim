noremap <F9> :w !ruby -cw<CR>
noremap <F12> :!ripper-tags -f .tags -R . --exclude vendor<CR>

setlocal omnifunc=rubycomplete#Complete

let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

imap ,, =>

let g:syntastic_ruby_checkers = ['rubocop', 'jruby', 'mri']
