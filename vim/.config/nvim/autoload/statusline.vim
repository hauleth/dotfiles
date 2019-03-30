scriptencoding utf-8

" displays a flag if there are unseen quickfix errors
function! statusline#quickfix() abort
    let l:ret = ''
    let l:ret .= get(g:, 'quickfix_pending') ? 'D' :' '
    let l:ret .= exists('g:asyncdo') || exists('w:asyncdo') ? 'R' : ' '

    return l:ret
endfunction

function! statusline#relpath() abort
    return expand('%:~:.')
endfunction

function! statusline#filename() abort
    if isdirectory(expand('%'))
        return 'Dirvish'
    elseif &buftype ==# 'nofile' && (&bufhidden ==# 'hidden' || &bufhidden ==# 'delete')
        return 'Scratch'
    else
        return fnamemodify(statusline#relpath(), ':t')
    endif
endfunction

function! statusline#path() abort
    return fnamemodify(statusline#relpath(), ':h')
endfunction

function! statusline#modified() abort
    return &modified ? ' +' : ''
endfunction

function! statusline#quickfix_name() abort
    return qf#IsQfWindow(winnr()) ? 'QuickFix' : 'Location'
endfunction
