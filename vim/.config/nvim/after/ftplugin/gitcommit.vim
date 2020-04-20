setlocal spell
setlocal commentstring=;%s
setlocal comments=:;

let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal nospell'
