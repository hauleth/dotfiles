scriptencoding utf-8

nnoremap <buffer><silent> q :cclose<CR>
nnoremap <buffer><silent> O <CR>:cclose<CR>

let &l:statusline  = ''
let &l:statusline .= ' '
let &l:statusline .= '» %{statusline#quickfix_name()} «%<'
let &l:statusline .= '%='
let &l:statusline .= '%{statusline#quickfix()}%4c:%l'
let &l:statusline .= ' '
