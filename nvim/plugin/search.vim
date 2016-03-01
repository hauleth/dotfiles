" Smart case searches
set ignorecase
set smartcase

" Better search
set magic

nnoremap <silent> <leader><leader> :<C-u>set nohlsearch <bar> update<CR>

noremap c* *``cgn
noremap c# #``cgN
noremap cg* g*``cgn
noremap cg# g#``cgN
