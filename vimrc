" Infect Vim with pathogen
call pathogen#infect()
call pathogen#helptags()

" Reset Vim shell to get rid of strange errors
set shell=/bin/sh

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

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
"set clipboard+=unnamedplus

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
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Powerline fonts
let g:airline_powerline_fonts = 1

" Show branch in Airline status bar
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '×'

" Show syntax errors
let g:airline#extensions#syntastic#enabled = 1

" Work with Tagbar
let g:airline#extensions#tagbar#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2

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

" Basic
noremap           <leader>fn :enew<CR>
noremap           <leader>fs :write<CR>
inoremap <silent> <leader>fs <C-O>:write<CR>

" Tabs
map <silent> <F7>       :tabprev<CR>
map <silent> <F8>       :tabnext<CR>
map <silent> <leader>tn :tabnew<CR>
map <silent> <leader>tc :tabclose<CR>

" Buffers
map <F5>        :bprev<CR>
map <F6>        :bnext<CR>
map <leader>bd  :Bclose<CR>
map <C-b>d      :Bclose<CR>
map <C-b>e      :BufExplorer<CR>

" Search
map <silent> <leader><space>   :nohlsearch<CR>
nmap <C-M>                     :nohlsearch<CR>

" Formatting and cleaning
map <leader>ff mzgg=G`z<CR>
map <leader>fc :Clean<CR>

" Split buffer
nmap <leader>bsh :leftabove  vnew<CR>
nmap <leader>bsl :rightbelow vnew<CR>
nmap <leader>bsk :leftabove  new<CR>
nmap <leader>bsj :rightbelow new<CR>
nmap <leader><left>  :leftabove  vnew<CR>
nmap <leader><right> :rightbelow vnew<CR>
nmap <leader><up>    :leftabove  new<CR>
nmap <leader><down>  :rightbelow new<CR>

nmap ZS :xa<CR>
nmap ZA :qa<CR>
nmap ZX :cq<CR>

" Split line at cursor position
nmap K i<CR><Esc>k$

" Text folding
inoremap <C-F>   <C-O>za
nnoremap <C-F>   za
nnoremap <space> za
onoremap <C-F>   <C-C>za

" Simplify switching to EX mode
nnoremap ; :

" Changing windows
map <silent> <C-k> :TmuxNavigateUp<CR>
map <silent> <C-h> :TmuxNavigateLeft<CR>
map <silent> <C-l> :TmuxNavigateRight<CR>
map <silent> <C-j> :TmuxNavigateDown<CR>
map <silent> <C-\> :TmuxNavigatePrevious<CR>

" Save file with ^q
noremap  <C-q> :w<CR>
inoremap <C-q> <C-o>:w<CR>

" Choose window
nmap - <Plug>(choosewin)

" Ctrl-F12 to generate ctags for current project
map <silent> <F12> :!ctags -f .tags . --append=yes --recurse=yes<CR>

" Align by given separator (available '=',':' and  ',')
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>

" Copy and paste to unnamed register (system register)
map <Leader>y "+y
map <Leader>p "+p

" Fast paste from system clipboard
inoremap <C-R><C-R> <C-R>*

" Some useful toggles for plugins
noremap <F2> :GundoToggle<CR>
noremap <F3> :NumbersToggle<CR>
noremap <F4> :IndentGuidesToggle<CR>

nmap <leader>o o<ESC>
nmap <leader>O O<ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completition
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menuone,menu
set tags=.tags,./.tags,tags,./tags

" Enable omni completion. (Ctrl-X Ctrl-O)
set completefunc=syntaxcomplete#Complete
set omnifunc=syntaxcomplete#Complete

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_userarrows = 1

nnoremap <F10> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extras
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_extensions=["md", "markdown"]
let g:gist_clip_command = 'xclip -selection clipboard'
let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(^\.(git|hg|svn)|(bundle|node_modules))$',
  \ 'file': '\v\.(log)$',
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr Tabularize Tab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extra commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove all trailing whitespaces
command! Clean %s/\s\+$//e | nohlsearch

" Save as root
command! W w !sudo tee % > /dev/null
