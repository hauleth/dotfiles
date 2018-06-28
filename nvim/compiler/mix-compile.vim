if exists('current_compiler')
    finish
endif
let current_compiler = 'mix-compile'

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat+=
            \**\ %s\ %f:%l:\ %m,
            \%Wwarning:\ %m,
            \%Z%f:%l:\ %m,
            \%Z%f:%l,
            \%C%m,
            \%-GCompiling%.%#,
            \%-GGenerated%.%#
CompilerSet makeprg=mix\ compile
