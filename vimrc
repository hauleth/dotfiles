" Infect Vim with pathogen
call pathogen#infect()
call pathogen#helptags()

set nocompatible

" Reset Vim shell to get rid of strange errors
set shell=/bin/sh

" Enable per-directory .vimrc files
set exrc
" Disable unsafe commands in local .vimrc
set secure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show statusline
set laststatus=2

" Turn on the Wild menu
set wildmenu

" Ignore all automatic files and folders
set wildignore=*.o,*~,*.pyc,.git,*/tmp/*

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Set to auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Line numbers are good
set number

" Shorter timeout when exiting insert mode
set ttimeoutlen=50

" Allow backspace in insert mode
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show incomplete cmds down the bottom
set showcmd

" Show current mode down the bottom
set showmode

" Disable cursor blink
set gcr=a:blinkon0

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Use mouse
set mouse=a

" Use tabs instead of buffers
" set switchbuf=usetab,newtab

" Use system clipboard as default
" set clipboard+=unnamedplus

" Set fold method
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax highlighting
syntax on

" Show 80 column
set colorcolumn=80

" Use Dark Solarized theme
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Identation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
au FileType Makefile set noexpandtab
au FileType snippet  set noexpandtab

" Display tabs and trailing spaces visually
set list listchars=tab:→\ ,trail:·

set nowrap       " Don't wrap lines
set linebreak    " Wrap lines at convenient points

set foldnestmax=3 " Deepest fold is 3 levels
set nofoldenable  " Don't fold by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','

" Fast save
map <leader>s :update<CR>

" Tabs
noremap <silent> <F7>       :tabprev<CR>
noremap <silent> <F8>       :tabnext<CR>
noremap <silent> <leader>tn :tabnew<CR>
noremap <silent> <leader>tc :tabclose<CR>

" Buffers
noremap <F5>        :bprev<CR>
noremap <F6>        :bnext<CR>
noremap <leader>bd  :Bclose<CR>
noremap <leader>be  :BufExplorer<CR>
noremap <C-b>d      :Bclose<CR>
noremap <C-b>e      :BufExplorer<CR>

" Search
noremap <silent> <leader><space>   :nohlsearch<CR>
nnoremap <C-M>                     :nohlsearch<CR>

" Formatting and cleaning
noremap <leader>ff mzgg=G`z<CR>
noremap <leader>fc :Clean<CR>

nnoremap ZS :xa<CR>
nnoremap ZA :qa<CR>
nnoremap ZX :cq<CR>

" Split line at cursor position
nnoremap K     i<CR><Esc>k$
nnoremap Q     K

" Text folding
nnoremap <space> za

" Simplify switching to EX mode
nnoremap ; :
vnoremap ; :
nnoremap : ;

" Choose window
nmap wc <Plug>(choosewin)

" Ctrl-F12 to generate ctags for current project
noremap <silent> <F12> :!ctags -f .tags . --append=yes --recurse=yes<CR>

" Copy and paste to unnamed register (system register)
noremap <Leader>y "+y
noremap <Leader>p "+p

" Fast paste from system clipboard
inoremap <C-R><C-R> <C-R>*

" Some useful toggles for plugins
noremap <F2> :GundoToggle<CR>
noremap <F3> :NumbersToggle<CR>
noremap <F4> :IndentGuidesToggle<CR>

" Git Fugitive commands
noremap <leader>gst :Gstatus<CR>
noremap <leader>gci :Gcommit<CR>
noremap <leader>gd  :Gdiff<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extras
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_extensions=["md", "markdown"]
let g:gist_clip_command = 'xsel -bi'
let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extra commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove all trailing whitespaces
command! Clean %s/\s\+$//e | nohlsearch

" Save as root
command! W w !sudo tee % > /dev/null
