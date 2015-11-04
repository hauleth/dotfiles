" vim:foldmethod=marker:foldlevel=0:foldenable

" Pathogen {{{
call pathogen#infect()
call pathogen#helptags()
" }}}
" Colors {{{
" Show 80 column
set colorcolumn=80
set cursorline

" Use Dark Solarized theme
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
" }}}
" Per directory .nvimrc {{{
set exrc
" Disable unsafe commands in local .vimrc
set secure
" }}}
" User interface {{{
" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

" Display tabs and trailing spaces visually
set list listchars=tab:→\ ,trail:·

" Line numbers are good
set number

" Show current mode down the bottom
set noshowmode

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Shorten interruptive command output
set shortmess=atI

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" Wrap line on movements
set whichwrap+=<,>,h,l,[,]
" }}}
" Key mappings {{{
let mapleader = ','

" Swap 'go to marger' mappings
nnoremap ' `
nnoremap ` '

" Buffers
noremap <F5>        :bprev<CR>
noremap <F6>        :bnext<CR>
noremap <leader>b   :Unite -buffer-name=buffers -immediately -no-split buffer<CR>

nnoremap gV `[v`]

" Closing
nnoremap ZS :xa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>

" Split line at cursor position
nnoremap K     i<CR><Esc>k$
nnoremap Q     K

" Simplify switching to EX mode
nnoremap ; :
vnoremap ; :
nnoremap : ;

" Choose window
nmap wc <Plug>(choosewin)

" Ctrl-F12 to generate ctags for current project
noremap <silent> <F12> :!ctags -f .tags -R .<CR>

" Yanks
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <silent> <Leader>y :Unite -buffer-name=yanks register history/yank<CR>

" Fast paste from system clipboard
inoremap <C-R><C-R> <C-R>*

" Some useful toggles for plugins
noremap <F2> :UndotreeToggle<CR>
noremap <F3> :NumbersToggle<CR>
noremap <F4> :IndentGuidesToggle<CR>

" Git Fugitive commands
noremap <leader>gst :Gstatus<CR>
noremap <leader>gci :Gcommit<CR>
noremap <leader>gd  :Gdiff<CR>
" }}}
" Search {{{
" Smart case searches
set ignorecase
set smartcase

" Better search
set magic

" Clear search highlights
noremap <leader>l :nohlsearch<CR>

" FuzzySearch
nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files file_rec/neovim<CR>
nnoremap <silent> <leader>/ :Ag<CR>
" }}}
" Files, backups and undo {{{
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir -p ~/.cache/backups > /dev/null 2>&1
set undodir=~/.cache/backups
set undofile
" }}}
" Identation and folding {{{
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
au FileType Makefile set noexpandtab
au FileType snippet  set noexpandtab

set textwidth=80
set nowrap       " Don't wrap lines
set linebreak    " Break lines at convenient points
set formatoptions+=t

" Formatting and cleaning
noremap <leader>ff mzgg=G`z<CR>
noremap <leader>fc :Clean<CR>

" Set fold method
set foldmethod=syntax
set foldlevel=3
set foldnestmax=5

" Text folding
nnoremap <space> za
" }}}
" Extras {{{
let g:markdown_extensions=["md", "markdown"]
let g:gist_clip_command = 'xsel -bi'
let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]
" }}}
" Extra commands {{{
command! Ag Unite -auto-preview -no-split -buffer-name=Ag grep:.

" Remove all trailing whitespaces
command! Clean %s/\s\+$//e | nohlsearch

" Save as root
command! W w !sudo tee % > /dev/null
" }}}
