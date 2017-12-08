command! -range=% IX <line1>,<line2>w !curl -F 'f:1=<-' ix.io | pbcopy
