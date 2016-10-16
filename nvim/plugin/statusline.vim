scriptencoding utf-8

let &statusline="%<%2n » %f «%{&modified ? ' +' : ''}%=%4c:%l %{ALEGetStatusLine()} "
