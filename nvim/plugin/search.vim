" Smart case searches
set ignorecase
set smartcase

" Better search
set magic

" Clear search highlights
noremap <leader>l :nohlsearch<CR>

let g:grepper = {
      \ 'open': 0,
      \ 'switch': 0,
      \ 'jump': 0,
      \ 'tools': ['ag', 'git'],
      \ }

noremap g/ :<C-u>Grepper<CR>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

command! -nargs=* -complete=file GG Grepper! -tool git -open -query <args>
command! -nargs=* -complete=file Ag Grepper! -tool ag -open -query <args>
