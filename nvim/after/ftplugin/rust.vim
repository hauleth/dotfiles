compiler cargo

setlocal iskeyword+=!
setlocal formatprg=rustfmt\ --write-mode=display
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1

inoreabbrev <buffer> excr extern crate

nnoremap <buffer> K     <Plug>(rust-doc)
nnoremap <buffer> <C-]> <Plug>(rust-def)

augroup rust_projectionist
    au!
    autocmd User ProjectionistDetect call projections#rust#detect()
augroup END
