" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.rust = '[(\.)(::)]'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete = 0
endfunction
