scriptencoding utf-8

setlocal nolist

nnoremap <buffer><silent> q :cclose<CR>
nnoremap <buffer><silent> qq :cclose<CR>
nnoremap <buffer><silent> o <CR>
nnoremap <buffer><silent> O <CR>:cclose<CR>

let &l:statusline  = ''
let &l:statusline .= ' '
let &l:statusline .= '» %{statusline#quickfix_name()} «%<'
let &l:statusline .= '%='
let &l:statusline .= '%{statusline#quickfix()}%4c:%l'
let &l:statusline .= ' '
