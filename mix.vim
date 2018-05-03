if exists('current_compiler')
    finish
endif
let current_compiler = 'mix-compile'

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat&
CompilerSet makeprg=mix
