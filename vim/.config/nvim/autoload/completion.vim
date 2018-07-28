let s:lsp_servers = [
            \ {
            \   'name': 'elixir-ls',
            \   'cmd': {server_info->[$HOME.'/.local/share/applications/lsp/language_server.sh']},
            \   'whitelist': ['elixir'],
            \ },
            \ {
            \   'name': 'rls',
            \   'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
            \   'whitelist': ['rust'],
            \ },
            \ {
            \   'name': 'vue-language-server',
            \   'cmd': {server_info->['vls']},
            \   'whitelist': ['vue'],
            \ },
            \ ]

func! s:append_env(env, path) abort
    return (a:env is# '' ? '' : a:env.':') . expand(a:path)
endfunc

func! s:setup_mappings() abort
    for l:server in lsp#get_whitelisted_servers()
        let l:cap = lsp#get_server_capabilities(l:server)

        if !empty(get(l:cap, 'completionProvider')) && empty(&omnifunc)
            setlocal omnifunc=lsp#complete
        endif

        if get(l:cap, 'definitionProvider') && maparg('<C-]>') is# ''
            nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
        endif

        if get(l:cap, 'documentFormattingProvider')
            nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
        endif

        if get(l:cap, 'hoverProvider')
            setlocal keywordprg=:LspHover
        endif
    endfor
endfunc

func! completion#lsp() abort
    for l:server in s:lsp_servers
        call lsp#register_server(l:server)
    endfor

    let g:lsp_log_file=$HOME.'/.local/share/nvim/lsp.log'

    call s:setup_mappings()

    augroup lsp_mappings
        autocmd!
        autocmd User lsp_server_init call s:setup_mappings()
        autocmd FileType * call s:setup_mappings()
    augroup END
endfunc
