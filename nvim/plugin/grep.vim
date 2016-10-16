set grepformat^=%f:%l:%c:%m

if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ag')
  set grepprg=ag\ --vimgrep
elseif executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
endif

