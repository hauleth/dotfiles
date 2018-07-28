if exists('g:loaded_did_you_mean')
    finish
endif
let g:loaded_did_you_mean = 1

augroup did_you_mean
    autocmd!
    autocmd BufNewFile * nested if !filereadable('%') | call did_you_mean#call() | endif
augroup END
