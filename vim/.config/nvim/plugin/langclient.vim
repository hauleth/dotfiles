let g:lsp_log_file = expand('~/vim-lsp.log')

func! s:set_colours(...) abort
endfunc

func! s:setup_ls(...) abort
    let l:servers = lsp#get_whitelisted_servers()

    for l:server in l:servers
        let l:cap = lsp#get_server_capabilities(l:server)

        if has_key(l:cap, 'completionProvider')
            setlocal omnifunc=lsp#complete
        endif

        if has_key(l:cap, 'hoverProvider')
            setlocal keywordprg=:LspHover
        endif

        if has_key(l:cap, 'definitionProvider')
            nmap <silent> <buffer> gd <plug>(lsp-definition)
        endif

        if has_key(l:cap, 'referencesProvider')
            nmap <silent> <buffer> gr <plug>(lsp-references)
        endif
    endfor
endfunc

func! s:nix_shell(command, ...) abort
    let l:path = a:0 > 0 ? a:1 : a:command

    return {_->['nix-shell', '--show-trace', '-p', l:path, '--run', a:command]}
endfunc

augroup LSC
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'ElixirLS',
                \ 'cmd': s:nix_shell('elixir-ls', 'elixirLS'),
                \ 'whitelist': ['elixir', 'eelixir']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'Sourcer',
                \ 'cmd': s:nix_shell('erlang_ls -t stdio --stdout', 'erlangSourcer'),
                \ 'whitelist': ['erlang']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'RLS',
                \ 'cmd': s:nix_shell('rls'),
                \ 'whitelist': ['rust']
                \})

    autocmd User lsp_server_init call <SID>setup_ls()
    autocmd BufEnter * call <SID>setup_ls()
augroup END
