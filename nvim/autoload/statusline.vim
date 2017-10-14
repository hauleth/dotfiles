" displays a flag if there are unseen quickfix errors
function! statusline#quickfix()
  return get(g:, 'quickfix_pending') ? '⎈' : ''
endfunction

function! statusline#modified()
    return &modified ? ' +' : ''
endfunction

function! statusline#repo()
    return gina#component#repo#branch() . ' ' .gina#component#status#preset('fancy')
endfunction
