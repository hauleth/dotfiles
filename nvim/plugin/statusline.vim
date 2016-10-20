scriptencoding utf-8

func! StatuslineErrors()
  if &modifiable
    return ' '.ALEGetStatusLine().' '
  else
    return ''
  endif
endfunc

let &statusline="%<%2n » %f «%{&modified ? ' +' : ''}%=%4c:%l %#Error#%{StatuslineErrors()}"
