compiler cargo

setlocal iskeyword+=!
let g:rustfmt_autosave = 1

inoreabbrev <buffer> excr extern crate

let b:undo_ftplugin = b:undo_ftplugin . ' | setl ep&'
