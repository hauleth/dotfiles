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

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,.git,tmp,log,vendor,node_modules,coverage

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

set colorcolumn=80

set background=dark
colorscheme solarized

" Powerline settings
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
"  exe 'source' f
"endfor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','

" Basic
noremap           <leader>fn   :enew<CR>
noremap           <leader>fs   :write<CR>
inoremap <silent> <leader>fs   <C-O>:write<CR>

" Tabs
map <silent> <F7>         :tabprev<CR>
map <silent> <F8>         :tabnext<CR>
map <silent> <leader>tn   :tabnew<CR>
map <silent> <leader>tc   :tabclose<CR>

" Buffers
map <F5>         :bprev<CR>
map <F6>         :bnext<CR>
map <leader>bd   :Bclose<CR>

" Search
map <silent> <leader><space>   :nohlsearch<CR>
nmap <C-M>                     :nohlsearch<CR>

" File tree and tag list
map <leader>ok             :NERDTreeToggle<CR>
map <leader>ol             :TlistToggle<CR>

" Formatting
map <leader>ffa             mzgg=G`z<CR>

" Split window
nmap <leader>wsh  :topleft  vnew<CR>
nmap <leader>wsl  :botright vnew<CR>
nmap <leader>wsk  :topleft  new<CR>
nmap <leader>wsj  :botright new<CR>

" Split buffer
nmap <leader>bsh  :leftabove  vnew<CR>
nmap <leader>bsl  :rightbelow vnew<CR>
nmap <leader>bsk  :leftabove  new<CR>
nmap <leader>bsj  :rightbelow new<CR>

nmap ZS         :xa<CR>
nmap ZA         :qa<CR>
nmap ZX         :cq<CR>

" Split line at cursor position
nmap K i<CR><Esc>k$

" text folding
inoremap <C-F>            <C-O>za
nnoremap <C-F>            za
nnoremap <space>          za
onoremap <C-F>            <C-C>za

" Simplify switching to EX mode
nnoremap ; :

" Changing windows
map <silent> <C-k>    :TmuxNavigateUp<CR>
map <silent> <C-h>    :TmuxNavigateLeft<CR>
map <silent> <C-l>    :TmuxNavigateRight<CR>
map <silent> <C-j>    :TmuxNavigateDown<CR>
map <silent> <C-\>    :TmuxNavigatePrevious<CR>

" Ctrl-F12 to generate ctags for current file
map <silent> <F12>        :!ctags -R --sort=yes --c++-kinds=+p --append=yes --fields=+iaS --exclude=.git --exclude=log --exclude=tmp --extra=+q -f .tags .<CR>

nmap <Leader>a=           :Tabularize /=<CR>
vmap <Leader>a=           :Tabularize /=<CR>
nmap <Leader>a:           :Tabularize /:\zs<CR>
vmap <Leader>a:           :Tabularize /:\zs<CR>
nmap <Leader>a,           :Tabularize /,\zs<CR>
vmap <Leader>a,           :Tabularize /,\zs<CR>

map <Leader>y "+y
map <Leader>p "+p

nnoremap <F2> :GundoToggle<CR>
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :IndentGuidesToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completition
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menuone,menu
set tags=.tags,./.tags,tags,./tags

" Enable omni completion. (Ctrl-X Ctrl-O)
set omnifunc=syntaxcomplete#Complete

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<C-Space>'
let g:SuperTabMappingBackward = '<S-C-Space>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Process_File_Always = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_SingleClick = 1
let Tlist_Auto_Highlight_Tag = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extras
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_extensions=["md", "markdown"]
let g:gist_clip_command = 'xclip -selection clipboard'

" Syntastic
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'

let g:syntastic_style_warning_symbol = '≈≈'

cmap w!! %!sudo tee > /dev/null %

command! Todo noautocmd vimgrep /TODO\|FIXME/j **/*.{py,rb,css,js,coffee,c,cpp,c++,cxx,h,hpp,h++,hxx,scss,sass} | cw

command! Clean %s/\s\+$//e | nohlsearch

command! W w !sudo tee % > /dev/null

" Cheat!
command! -complete=file -nargs=+ Cheat call s:cheat(<f-args>)
function! s:cheat(command)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  execute 'silent $read !cheat '.escape(a:command,'%#')
  setlocal nomodifiable
  1
endfunction

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

"delete the buffer; keep windows; create a scratch buffer if no buffers left
function! s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
    else
      enew
      let l:newBuf = bufnr("%")
      windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
  endif
  execute s:kwbdWinNum . 'wincmd w'
endif
if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
  execute "bd! " . s:kwbdBufNum
endif
if(!s:buflistedLeft)
  set buflisted
  set bufhidden=delete
  set buftype=
  setlocal noswapfile
endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Bclose call s:Kwbd(1)
