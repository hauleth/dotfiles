func! utils#cleanup() abort
    for buf in filter(getbufinfo({'buflisted':1}), {_, v -> !filereadable(v.name) && empty(v.windows)})
        exec 'bd '.buf.bufnr
        echo buf.name
    endfor
endfunc
