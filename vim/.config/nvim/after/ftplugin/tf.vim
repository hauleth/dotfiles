setlocal makeprg=terraform
setlocal equalprg=terraform\ fmt\ -
setlocal shiftwidth=2

augroup autoformat
    au!
    au BufWritePre <buffer> norm! gg=G``
augroup END

let b:undo_ftplugin = 'setl mp& fp& sw&'
