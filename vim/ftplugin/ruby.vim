map <F9> :w !ruby -cw<CR>

let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

imap ,, =>

setlocal omnifunc=rubycomplete#Complete

let g:syntastic_ruby_checkers = ['rubocop', 'jruby', 'mri']
