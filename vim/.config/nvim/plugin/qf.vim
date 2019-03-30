if exists('g:loaded_hqf')
    finish
endif
let g:loaded_hqf = 1

function! s:load_file(type, bang, file) abort
    let l:efm = &l:efm
    let &l:errorformat = "%-G%f:%l: All of '%#%.depend'%.%#,%f%.%l col %c%. %m"
    let l:cmd = a:bang ? 'getfile' : 'file'
    exec a:type.l:cmd.' '.a:file
    let &l:efm = l:efm
endfunction

command! -complete=file -nargs=1 -bang Cfile call <SID>load_file('c', <bang>0, <f-args>)
command! -complete=file -nargs=1 -bang Lfile call <SID>load_file('l', <bang>0, <f-args>)
