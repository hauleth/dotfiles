if exists('g:loaded_pack_delayed')
    finish
endif
let g:loaded_pack_delayed = 1

func! DelayedLoad(...) abort " No abort as we want to continue if any plugin fails
    " Git
    packadd vim-unimpaired
    packadd targets.vim

    autocmd! delayed_pack_load
endfunc

augroup delayed_pack_load
    autocmd!
    autocmd CursorHold,CursorMoved,VimEnter * call timer_start(0, function('DelayedLoad'))
augroup end
