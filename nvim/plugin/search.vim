" Smart case searches
set ignorecase
set smartcase

" Better search
set magic

" Global search
let g:grepper = {
      \ 'open': 0,
      \ 'switch': 0,
      \ 'jump': 0,
      \ 'tools': ['ag', 'git'],
      \ }

noremap g/ :<C-u>Grepper<CR>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

command! -nargs=* -complete=file GG Grepper -tool git -open -query <args>
command! -nargs=* -complete=file Ag Grepper -tool ag -open -query <args>

" Local file search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map z/ <Plug>(incsearch-stay)

" Fuzzy
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

map gz/ <Plug>(incsearch-easymotion-/)
map gz? <Plug>(incsearch-easymotion-?)
map gzg/ <Plug>(incsearch-easymotion-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
