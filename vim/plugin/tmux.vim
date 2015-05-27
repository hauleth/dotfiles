let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-k> :TmuxNavigateDown<cr>
nnoremap <silent> <C-j> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

noremap <leader>vl :VimuxRunLastCommand<CR>
noremap <leader>vi :VimuxInspectPanel<CR>
noremap <leader>vq :VimuxCloseRunner<CR>
noremap <leader>vx :VimuxInterruptRunner<CR>
noremap <leader>vz :call VimuxZoomRunner()<CR>
