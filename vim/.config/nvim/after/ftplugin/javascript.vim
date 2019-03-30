setlocal shiftwidth=2
setlocal makeprg=yarn

setlocal includeexpr=ft#javascript#includeexpr(v:fname)

setlocal isfname+=@-@

let b:undo_ftplugin = b:undo_ftplugin . ' | setl sw& mp& inex& isf&'
