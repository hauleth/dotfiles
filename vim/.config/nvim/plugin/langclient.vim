let g:lsp_log_file = expand('~/vim-lsp.log')

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

augroup LSC
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'ElixirLS',
                \ 'cmd': {_->[$HOME.'/.local/share/applications/lsp/language_server.sh']},
                \ 'whitelist': ['elixir', 'eelixir']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'RLS',
                \ 'cmd': {_->['rls']},
                \ 'whitelist': ['rust']
                \})
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'solargraph',
                \ 'cmd': {server_info->['solargraph', 'stdio']},
                \ 'initialization_options': {"diagnostics": "true"},
                \ 'whitelist': ['ruby'],
                \ })
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'dot',
                \ 'cmd': {server_info->['dot-language-server', '--stdio']},
                \ 'whitelist': ['dot'],
                \ })

    autocmd User lsp_server_init call <SID>setup_ls()
    autocmd BufEnter * call <SID>setup_ls()
augroup END
