setlocal bufhidden=wipe

let b:undo_ftplugin = b:undo_ftplugin . '| setl bh&'
