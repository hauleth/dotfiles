" Smart case searches
set ignorecase
set smartcase

" Better search
set magic

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
