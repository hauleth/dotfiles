" Formatting and cleaning
noremap g= :<C-u>Format<CR>

command! Clean %s/\s\+$//e | nohlsearch
command! Format norm gg=Gg``
