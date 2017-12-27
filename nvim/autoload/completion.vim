let s:lsp_servers = [
            \ {
            \   'name': 'elixir-ls',
            \   'cmd': {server_info->
            \       [&shell,
            \        &shellcmdflag,
            \        'env ERL_LIBS='.<SID>append_env($ERL_LIBS, '~/Workspace/JakeBecker/elixir-ls/lsp').' mix elixir_ls.language_server']},
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

func! s:has_server() abort
    return len(lsp#get_whitelisted_servers()) > 0
endfunc

func! s:setup_mappings() abort
    if !s:has_server() | return | endif

    if empty(&omnifunc)
        setlocal omnifunc=lsp#complete
    endif

    if !maparg('<C-]>') isnot# ''
        nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
    endif

    if !maparg('K') isnot# ''
        nnoremap <buffer> K :<C-u>LspHover<CR>
    endif
endfunc

func! completion#lsp() abort
    for l:server in s:lsp_servers
        call lsp#register_server(l:server)
    endfor

    let g:lsp_log_verbose = 1
    let g:lsp_log_file=$HOME.'/.local/share/nvim/lsp.log'

    call s:setup_mappings()

    augroup lsp_completion
        au!
        au FileType * call s:setup_mappings()
    augroup END
endfunc
