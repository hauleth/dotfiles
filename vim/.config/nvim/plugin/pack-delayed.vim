if exists('g:loaded_pack_delayed')
    finish
endif
let g:loaded_pack_delayed = 1

func! DelayedLoad(...) abort " No abort as we want to continue if any plugin fails
    echom 'Loading plugins'

    " Git
    packadd vim-fugitive
                \ | call fugitive#detect(getcwd())

    packadd vim-unimpaired
    packadd targets.vim

    autocmd! delayed_pack_load

    echom 'Loaded plugins'
endfunc

augroup delayed_pack_load
    autocmd!
    autocmd CursorHold,CursorMoved,VimEnter * call timer_start(0, function('DelayedLoad'))
augroup end
