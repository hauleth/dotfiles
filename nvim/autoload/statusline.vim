scriptencoding utf-8

" displays a flag if there are unseen quickfix errors
function! statusline#quickfix() abort
    let l:ret = ''
    let l:ret .= get(g:, 'quickfix_pending') ? '🏁' :' '
    let l:ret .= exists('g:asyncdo') || exists('w:asyncdo') ? '🏃' : ' '

    return l:ret
endfunction

function! statusline#modified() abort
    return &modified ? ' +' : ''
endfunction

function! statusline#quickfix_name() abort
    return qf#IsQfWindow(winnr()) ? 'QuickFix' : 'Location'
endfunction
