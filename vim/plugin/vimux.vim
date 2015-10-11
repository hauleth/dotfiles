let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

noremap <leader>vl :VimuxRunLastCommand<CR>
noremap <leader>vi :VimuxInspectPanel<CR>
noremap <leader>vq :VimuxCloseRunner<CR>
noremap <leader>vx :VimuxInterruptRunner<CR>
noremap <leader>vz :call VimuxZoomRunner()<CR>
