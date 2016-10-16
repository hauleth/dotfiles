nnoremap U <nop>
nnoremap Us :<C-u>Gstatus<CR>
nnoremap Up :<C-u>Git push<CR>
nnoremap Ud :<C-u>Gdiff<CR>
nnoremap UB :<C-u>Gblame<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Um :<C-u>Gmerge<CR>
nnoremap Uu :<C-u>Git pull --all<CR>
nnoremap Uf :<C-u>GitFiles<CR>
nnoremap Ul :<C-u>GV<CR>
nnoremap UL :<C-u>GV!<CR>
nmap UU Uu

let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_removed = '▖'
let g:gitgutter_sign_removed_first_line = '▘'
let g:gitgutter_sign_modified = '▐'
let g:gitgutter_sign_modified_removed = '▞'
