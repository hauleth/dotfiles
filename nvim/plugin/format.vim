" Formatting and cleaning
noremap g= :<C-u>Format<CR>

command! Clean let _s=@/ | %s/\s\+$//e | let @/=_s | nohlsearch
command! Format norm gg=Gg``
