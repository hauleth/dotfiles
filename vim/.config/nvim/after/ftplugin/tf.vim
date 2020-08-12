setlocal makeprg=terraform
setlocal equalprg=terraform\ fmt\ -
setlocal shiftwidth=2

let b:undo_ftplugin = 'setl mp& fp& sw&'
