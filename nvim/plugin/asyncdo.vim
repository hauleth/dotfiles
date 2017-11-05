func! s:populate(file, cmd) abort
    unlet! t:job
    try
        exe 'cgetfile '.a:file
    finally
        call setqflist([], 'a', {'title': a:cmd})
    endtry
endfunc

func! AsyncDo(...) abort
    if exists('t:job')
        echoerr 'There is currently running job, just wait'
        return
    endif

    call setqflist([], 'r')
    let tmp = tempname()
    let cmd = join(a:000)

    let g:qf_quickfix_titles = []
    if has('nvim')
        let t:job = jobstart([&sh, &shcf, printf(cmd.&srr, tmp)], {
                    \ 'on_exit': {id, data, event -> s:populate(tmp, cmd)}
                    \ })
    else
        let t:job = job_start([&sh, &shcf, printf(cmd.&srr, tmp)], {
                    \ 'in_io': 'null','out_io': 'null','err_io': 'null',
                    \ 'exit_cb': {job, result -> s:populate(tmp, cmd)}
                    \ })
    endif
endfunc

com! -nargs=+ AsyncDo call AsyncDo(<f-args>)
