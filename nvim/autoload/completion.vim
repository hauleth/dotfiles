let s:servers = get(g:, 'lsp_servers', [])

func! s:setup_omnifunc() abort
    if len(lsp#get_whitelisted_servers()) > 0
        setlocal omnifunc=lsp#complete
    endif
endfunc

func! completion#lsp() abort
    let g:lsp_async_completion = 1

    for l:server in s:servers
        call lsp#register_server(l:server)
    endfor

    augroup lsp_completion
        au!
        au FileType * call s:setup_omnifunc()
    augroup END
endfunc
