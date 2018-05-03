runtime! ftplugin/javascript.vim

" Override HTML completion
setlocal omnifunc=lsp#complete

augroup fix_vue_syntax
    au!
    autocmd BufEnter <buffer> syntax sync fromstart
augroup END
