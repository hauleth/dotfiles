if exists('g:loaded_pack_delayed')
    finish
endif
let g:loaded_pack_delayed = 1

func! s:delayed_load(...) " No abort as we want to continue if any plugin fails
    echom 'Loading plugins'

    " Git
    packadd vim-fugitive
                \ | call fugitive#detect(getcwd())
                \ | packadd vim-merginal

    packadd asyncdo.vim
    packadd auto-pairs
    packadd echodoc.vim
    packadd sad.vim
    packadd splitjoin.vim
    packadd targets.vim
    packadd vim-choosewin
    packadd vim-commentary
    packadd vim-enmasse
    packadd vim-eunuch
    packadd vim-exchange
    packadd vim-lion
    packadd vim-qf
    packadd vim-qlist
    packadd vim-rsi
    packadd vim-snipe
    packadd vim-surround
    packadd vim-unimpaired
    echom 'Loaded plugins'

    au! delayed_pack_load VimEnter *
endfunc

augroup delayed_pack_load
    autocmd!
    autocmd VimEnter * call timer_start(0, function('s:delayed_load'))
augroup end
