" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.rust = '[(\.)(::)]'

inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-n>" :
      \ deoplete#mappings#manual_complete()
