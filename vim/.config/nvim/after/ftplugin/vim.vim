setlocal omnifunc=complimentary#CompleteCpty
setlocal iskeyword-=-

packadd vim-scriptease

let b:undo_ftplugin = b:undo_ftplugin . ' | setl ofu& | setl iskeyword+=-'
