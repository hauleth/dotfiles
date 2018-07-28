setlocal formatprg=jq\ .
setlocal shiftwidth=2

augroup node_projectionist
    au!
    autocmd User ProjectionistDetect call projections#node#detect()
augroup END
