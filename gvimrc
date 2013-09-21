set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10

set guioptions-=T
set guioptions-=e
set t_Co=256
set guitablabel=%M\ %t:w

" Basic
noremap           <C-S>   :write<CR>
inoremap <silent> <C-S>   <C-O>:write<CR>

" Split window
nmap <silent> <S-A-Left>  :topleft  vnew<CR>
nmap <silent> <S-A-Right> :botright vnew<CR>
nmap <silent> <S-A-Up>    :topleft  new<CR>
nmap <silent> <S-A-Down>  :botright new<CR>

" Split buffer
nmap <silent> <A-Left>   :leftabove  vnew<CR>
nmap <silent> <A-Right>  :rightbelow vnew<CR>
nmap <silent> <A-Up>     :leftabove  new<CR>
nmap <silent> <A-Down>   :rightbelow new<CR>

" Changing windows
map  <silent> <C-Left>   :wincmd h<CR>
map  <silent> <C-Right>  :wincmd l<CR>
map  <silent> <C-Up>     :wincmd k<CR>
map  <silent> <C-Down>   :wincmd j<CR>
nmap <S-ESC>             :close<CR>

" Buffers
noremap <silent> <C-D>    :Bclose<CR>
