func! s:pick_fuzzy() abort
    let l:cmdtype = getcmdtype()

    if l:cmdtype =~? '[/?]'
        return '.\{-}'
    elseif l:cmdtype == ':' && getcmdline() =~# '^find\s'
        return '*'
    endif

    return "\<C-]> "
endfunc

cnoremap <expr> <space> <SID>pick_fuzzy()
