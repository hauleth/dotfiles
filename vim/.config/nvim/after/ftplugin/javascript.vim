setlocal shiftwidth=2
setlocal makeprg=yarn

setlocal includeexpr=ft#javascript#includeexpr(v:fname)

augroup node_projectionist
    au!
    autocmd User ProjectionistDetect call projections#node#detect()
augroup END
