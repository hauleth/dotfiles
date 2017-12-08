setlocal tabstop=2

augroup node_projectionist
    au!
    autocmd User ProjectionistDetect call projections#node#detect()
augroup END

ClearSwapList

SwapList variable let const
