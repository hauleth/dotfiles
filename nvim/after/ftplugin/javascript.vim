setlocal tabstop=2
setlocal makeprg=yarn

augroup node_projectionist
    au!
    autocmd User ProjectionistDetect call projections#node#detect()
augroup END

ClearSwapList

SwapList variable let const
