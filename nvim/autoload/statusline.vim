scriptencoding utf-8

" displays a flag if there are unseen quickfix errors
function! statusline#quickfix() abort
  return get(g:, 'quickfix_pending') ? '⎈' : ''
endfunction

function! statusline#modified() abort
    return &modified ? ' +' : ''
endfunction

function! statusline#repo() abort
    return gina#component#repo#branch()
endfunction

function! statusline#quickfix_name() abort
    return qf#IsQfWindow(winnr()) ? 'QuickFix' : 'Location'
endfunction
