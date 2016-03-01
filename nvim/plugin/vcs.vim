let g:signify_sign_add = '▌'
let g:signify_sign_delete = '▖'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_change = '▐'
let g:signify_sign_changedelete = '▞'

let g:signify_sign_show_count = 0

nnoremap U <nop>
nnoremap Us :<C-u>Gstatus<CR>
nnoremap Ud :<C-u>Gdiff<CR>
nnoremap Ub :<C-u>Gblame<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Um :<C-u>Gmerge<CR>
nnoremap Uu :<C-u>Git up<CR>
nmap UU Uu
