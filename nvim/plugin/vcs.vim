let g:signify_sign_add = '▌'
let g:signify_sign_delete = '▖'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_change = '▐'
let g:signify_sign_changedelete = '▞'

let g:signify_sign_show_count = 0

" highlight lines in Sy and vimdiff etc.)

highlight DiffAdd           ctermfg=10
highlight DiffDelete        ctermfg=9
highlight DiffChange        ctermfg=11

" highlight signs in Sy

highlight SignifySignAdd     ctermfg=10
highlight SignifySignDelete  ctermfg=9
highlight SignifySignChange  ctermfg=11
