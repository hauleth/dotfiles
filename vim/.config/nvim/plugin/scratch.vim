if exists('g:loaded_scratch')
    finish
endif
let g:loaded_scratch = 1

command! Scratchify setlocal nobuflisted noswapfile buftype=nofile bufhidden=delete
command! Scratch  enew   |Scratchify
command! SScratch new    +Scratchify
command! VScratch vnew   +Scratchify
command! TScratch tabnew +Scratchify
