function! open#open() abort
    if a:0 > 0
        let l:name = a:1
    else
        let l:name = expand('<cfile>')
    endif

    call jobstart(['open', l:name], { 'detach': v:true })

    echo 'Open '.l:name
endfunction
