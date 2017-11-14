func! s:get_ident(str) abort
    return matchstr(a:str, 'def\(module\|macro\|p\)\?\s\+\zs\f\+\ze')
endfunc

func! ft#elixir#module_name() abort
    let l:view = winsaveview()
    let l:name = s:get_ident(getline(search('^\s*defmodule\s', 'bW')))
    call winrestview(l:view)

    return l:name
endfunc

func! ft#elixir#full_ident() abort
    let l:line = getline('.')

    if l:line =~# '^\s*def\s\+\k'
        return ft#elixir#module_name().'.'.s:get_ident(l:line)
    elseif l:line =~# '^\s*defmodule\s\+\k\+'
        return s:get_ident(l:line)
    else
        echoerr 'No ident in current line'
    endif
endfunc
