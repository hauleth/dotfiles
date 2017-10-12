setlocal makeprg=terraform
setlocal formatprg=terraform\ fmt\ -
setlocal ts=2

augroup autoformat
    au!

    au BufWritePre <buffer> norm! gggqG``
augroup END
