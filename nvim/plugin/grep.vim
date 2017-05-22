if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

