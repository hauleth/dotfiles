scriptencoding utf-8

let &statusline  = ' '
let &statusline .= '» %{statusline#filename()}%{statusline#modified()} «%<'
let &statusline .= ' '
let &statusline .= '%#StatusLineNC#%{statusline#path()}%*'
let &statusline .= '%='
let &statusline .= '%{statusline#quickfix()} %4c:%l'
