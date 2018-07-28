if exists('g:loaded_pastebin')
    finish
endif
let g:loaded_pastebin = 1

command! -range=% IX <line1>,<line2>w !curl -F 'f:1=<-' ix.io | pbcopy
