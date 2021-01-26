let g:vimwiki_list = [{'path': '~/Documents/Wiki/'}]
let g:vimwiki_key_mappings =
      \ {
      \ 'headers': 0,
      \ }

nnoremap <C-b><C-b> :<C-u>split +VimwikiIndex<CR>
nnoremap <C-b>t :<C-u>split +VimwikiTabIndex<CR>
nnoremap <C-b>d :<C-u>split +VimwikiMakeDairyNote<CR>
