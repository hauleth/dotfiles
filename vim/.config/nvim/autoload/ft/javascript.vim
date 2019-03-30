func! ft#javascript#includeexpr(path) abort
    echom a:path
    return substitute(a:path, '^[\~@]/', '', '')
endfunc
