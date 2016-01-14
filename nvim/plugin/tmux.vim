let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-up>    :TmuxNavigateUp<cr>
nnoremap <silent> <C-down>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

noremap <leader>vl :VimuxRunLastCommand<CR>
noremap <leader>vi :VimuxInspectPanel<CR>
noremap <leader>vq :VimuxCloseRunner<CR>
noremap <leader>vx :VimuxInterruptRunner<CR>
noremap <leader>vz :call VimuxZoomRunner()<CR>
