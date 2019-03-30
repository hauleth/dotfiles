runtime! ftplugin/javascript.vim

augroup fix_vue_syntax
    au!
    autocmd BufEnter <buffer> syntax sync fromstart
augroup END
