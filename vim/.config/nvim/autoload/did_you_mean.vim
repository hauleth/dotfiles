func! did_you_mean#call()
    try
        let l:glob = expand('%').'*'
        let l:matching_files = glob(l:glob, v:false, v:true)

        if empty(l:matching_files) | return | endif
    catch
        return
    endtry

    let l:shown_items = ['Did you mean:']

    for i in range(1, len(l:matching_files))
        call add(l:shown_items, i.'. '.l:matching_files[i-1])
    endfor

    let l:selected_number = inputlist(l:shown_items)
    if l:selected_number >= 1 && l:selected_number <= len(l:matching_files)
        let l:tmp = @#
        let l:empty_buffer_nr = bufnr('%')
        execute 'edit ' . fnameescape(l:matching_files[l:selected_number-1])
        execute 'silent bdelete ' . l:empty_buffer_nr
        let @# = l:tmp
    endif
endfunc
