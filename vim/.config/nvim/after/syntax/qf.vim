" Extra qf syntax

if !get(g:, 'kickfix_zebra', 1)
  finish
endif

syn sync fromstart

syn match  qfFileName1  /^[^|]\+/ nextgroup=qfSeparator contained
syn match  qfFileName2  /^[^|]\+/ nextgroup=qfSeparator contained

syn region  qfZebra1  start=/^\z([^|]\+\)/ end=/\n\(\z1|\)\@!/ nextgroup=qfZebra2 skipnl keepend fold contains=qfFileName1
syn region  qfZebra2  start=/^\z([^|]\+\)/ end=/\n\(\z1|\)\@!/ nextgroup=qfZebra1 skipnl keepend fold contains=qfFileName2

hi def link qfFileName1 Directory
hi def link qfFileName2 Question
