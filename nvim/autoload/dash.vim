func! dash#open(...) abort
    if a:0 > 0
        let l:name = a:1
    else
        let l:name = expand('<cword>')
    endif

    call jobstart(['open', 'dash://'.l:name], { 'detach': v:true })
endfunc
