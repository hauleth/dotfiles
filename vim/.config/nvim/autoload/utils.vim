func! utils#cleanup() abort
    let l:bufers = filter(getbufinfo({'buflisted':1}), {_, v -> !filereadable(v.name) && empty(v.windows)})
    for buf in l:bufers
        exec 'bd '.buf.bufnr
    endfor

    return l:bufers
endfunc
