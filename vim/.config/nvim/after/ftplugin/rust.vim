compiler cargo

setlocal iskeyword+=!
setlocal formatprg=rustfmt\ --write-mode=display
let g:rustfmt_autosave = 1

inoreabbrev <buffer> excr extern crate

augroup rust_projectionist
    au!
    autocmd User ProjectionistDetect call projections#rust#detect()
augroup END
