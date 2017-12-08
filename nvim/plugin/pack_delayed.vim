func! s:delayed_load(...) abort
    packadd asyncdo.vim
    packadd auto-pairs
    packadd sad.vim
    packadd splitjoin.vim
    packadd targets.vim
    packadd vim-choosewin
    packadd vim-commentary
    packadd vim-endwise
    packadd vim-enmasse
    packadd vim-eunuch
    packadd vim-exchange
    packadd vim-highlightedyank
    packadd vim-lion
    packadd vim-qf
    packadd vim-qlist
    packadd vim-repeat
    packadd vim-snipe
    packadd vim-surround
    packadd vim-unimpaired
    packadd vim-lsp
    packadd echodoc.vim

    call lsp#enable()

    au! delayed_pack_load BufEnter *
endfunc

augroup delayed_pack_load
    autocmd!
    autocmd BufEnter * call timer_start(100, function('s:delayed_load'))
augroup end
