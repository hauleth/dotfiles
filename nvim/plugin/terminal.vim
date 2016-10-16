nnoremap <C-q> <nop>
nnoremap <C-q>c :<C-u>term<CR>
nnoremap <C-q>s :<C-u>split +term<CR>
nnoremap <C-q>v :<C-u>vsplit +term<CR>
nnoremap <C-q>t :<C-u>tab term<CR>

tnoremap <C-q> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

au BufEnter term://* startinsert
let g:terminal_color_0 = "#2a3158"
let g:terminal_color_1 = "#e27878"
let g:terminal_color_2 = "#89b8c2"
let g:terminal_color_3 = "#e4aa80"
let g:terminal_color_4 = "#84a0c6"
let g:terminal_color_5 = "#d1a8ad"
let g:terminal_color_6 = "#adc1cb"
let g:terminal_color_7 = "#c6c8d1"
let g:terminal_color_8 = "#444b71"
let g:terminal_color_9 = "#e2a478"
let g:terminal_color_10 = "#b4be82"
let g:terminal_color_11 = "#d8e599"
let g:terminal_color_12 = "#3e445e"
let g:terminal_color_13 = "#673e43"
let g:terminal_color_14 = "#686f9a"
let g:terminal_color_15 = "#d4d5db"
