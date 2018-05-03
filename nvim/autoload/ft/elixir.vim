func! s:get_ident(str) abort
    return matchstr(a:str, 'def\%(module\|macro\|delegate\)\?\s\+\zs[A-Z][A-Za-z0-9._]*\ze')
endfunc

func! ft#elixir#module_name() abort
    let l:view = winsaveview()

    let l:name = ''
    let l:count = searchpair('\<do:\@!\>', '', '\<end\>', 'cbrmW', 'getline(".")!~#"^\\s*defmodule"')
    call winrestview(l:view)

    for i in range(l:count)
        call searchpair('\<do:\@!\>', '', '\<end\>', 'bW', 'getline(".")!~#"^\\s*defmodule"')
        let l:name = s:get_ident(getline('.')).l:name

        if i < l:count - 1
            let l:name = '.'.l:name
        endif
    endfor

    call winrestview(l:view)
    return l:name
endfunc

func! ft#elixir#full_ident() abort
    let l:view = winsaveview()
    call search('^\s*def', 'cbW')
    let l:line = getline('.')
    call winrestview(l:view)

    if l:line =~# '^\s*def\%(macro\|delegate\)\?\s\+\k'
        return ft#elixir#module_name().'.'.s:get_ident(l:line)
    elseif l:line =~# '^\s*defmodule\s\+\k\+'
        return ft#elixir#module_name()
    else
        echoerr 'No ident in current line'
    endif
endfunc

func! ft#elixir#mix_compl(lead, ...) abort
    return systemlist("mix help | awk '/^mix ".a:lead."/ { print $2 }'")
endfunc
