setlocal makeprg=terraform
setlocal formatprg=terraform\ fmt\ -
setlocal tabstop=2

augroup autoformat
    au!
    au BufWritePre <buffer> norm! gggqG``
augroup END
