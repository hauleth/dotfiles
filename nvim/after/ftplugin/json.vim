setlocal formatprg=jq\ .

augroup node_projectionist
    au!
    autocmd User ProjectionistDetect call projections#node#detect()
augroup END
