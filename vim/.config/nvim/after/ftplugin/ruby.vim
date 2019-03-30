setlocal formatprg=rubocop-clean
setlocal shiftwidth=2

let b:undo_ftplugin = b:undo_ftplugin . ' | setl fp& sw&'
