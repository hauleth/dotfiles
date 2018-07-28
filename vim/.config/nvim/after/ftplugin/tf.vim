setlocal makeprg=terraform
setlocal formatprg=terraform\ fmt\ -
setlocal shiftwidth=2

augroup autoformat
    au!
    au BufWritePre <buffer> norm! gggqG``
augroup END
