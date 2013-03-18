" Infect Vim with pathogen
call pathogen#infect()

" Use ZSH as Vim shell to get rid of strange errors
set shell=/bin/zsh

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

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,.git,tmp,log,vendor

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
set tm=500

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

set colorcolumn=100

" Set extra options when running in GUI mode
if has("gui_running")
  set background=dark
  colorscheme solarized

  set guifont=Inconsolata\ 12

  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t:w

  "highlight OverLength guibg=#592929
  "match OverLength /\%>100v.\+/

  " Powerline settings
  let g:Powerline_symbols = 'fancy'
  let g:Powerline_theme = 'solarized256'
  let g:Powerline_colorscheme = 'solarized256'
endif

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
set list listchars=tab:\ \ ,trail:·

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
noremap           <C-N>   :enew<CR>
noremap           <C-S>   :write<CR>
inoremap <silent> <C-S>   <C-O>:write<CR>

" Tabs
map <silent> <F7>         :tabprev<CR>
map <silent> <F8>         :tabnext<CR>
map <silent> <leader>tn   :tabnew<CR>
map <silent> <leader>tc   :tabclose<CR>
map <silent> <S-Tab>      :tabnext<CR>

" Buffers
map <silent> <F5>         :bprev<CR>
map <silent> <F6>         :bnext<CR>
map <silent> <leader>bd   :Bclose<CR>
noremap <silent> <C-D>    :Bclose<CR>
map <silent> <leader>be   :BufExplorer<CR>

" Search
map <silent> <leader><space>   :nohlsearch<CR>
nmap <C-M>                     :nohlsearch<CR>

" File tree and tag list
map <leader>ok             :NERDTreeToggle<CR>
map <leader>ol             :TlistToggle<CR>

" Split window
nmap <S-A-left>  :topleft  vnew<CR>
nmap <S-A-right> :botright vnew<CR>
nmap <S-A-up>    :topleft  new<CR>
nmap <S-A-down>  :botright new<CR>

" Split buffer
nmap <A-left>   :leftabove  vnew<CR>
nmap <A-right>  :rightbelow vnew<CR>
nmap <A-up>     :leftabove  new<CR>
nmap <A-down>   :rightbelow new<CR>

nmap <S-ESC>    :close<CR>

" Split line at cursor position
nmap K i<CR><Esc>k$

" Completion
inoremap <C-Space>        <C-X><C-O>
inoremap <S-Space>        <C-X><C-L>

" text folding
inoremap <C-F>            <C-O>za
nnoremap <C-F>            za
nnoremap <space>          za
onoremap <C-F>            <C-C>za

map <silent> <C-Up>       :wincmd k<CR>
map <silent> <C-Left>     :wincmd h<CR>
map <silent> <C-Right>    :wincmd l<CR>
map <silent> <C-Down>     :wincmd j<CR>

" Ctrl-F12 to generate ctags for current file
map <silent> <F12>        :!ctags -R --sort=yes --c++-kinds=+p --append=yes --fields=+iaS --exclude=.git --exclude=log --extra=+q -f .tags .<CR>

nmap <Leader>a=           :Tabularize /=<CR>
vmap <Leader>a=           :Tabularize /=<CR>
nmap <Leader>a:           :Tabularize /:\zs<CR>
vmap <Leader>a:           :Tabularize /:\zs<CR>
nmap <Leader>a,           :Tabularize /,\zs<CR>
vmap <Leader>a,           :Tabularize /,\zs<CR>

map <Leader>y "+y
map <Leader>p "+p

nnoremap <F2> :GitGutterToggle<CR>
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :IndentGuidesToggle<CR>

" Automatically tabelize pipe-delimited tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Check syntax or preview file
au FileType markdown map <silent> <F9> :!markdown-preview % &<CR>
au FileType ruby     map <silent> <F9> :!ruby -c %<CR>
au FileType scss     map <silent> <F9> :!scss -c %<CR>
au FileType sass     map <silent> <F9> :!sass -c %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completition
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menuone,menu

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html           setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python         setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css            set omnifunc=csscomplete#CompleteCSS
autocmd FileType c              set omnifunc=ccomplete#Complete
autocmd FileType c              set tags+=~/.vim/tags/stdlib
autocmd FileType java           set omnifunc=javacomplete#Complete
autocmd FileType ruby,eruby     set omnifunc=rubycomplete#Complete
autocmd Filetype *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif

autocmd BufNewFile,BufRead *.scss   set ft=scss.css syntax=scss
autocmd BufNewFile,BufRead *.sass   set ft=sass.css syntax=sass

autocmd FileType ruby,eruby         let g:rubycomplete_buffer_loading = 0
autocmd FileType ruby,eruby         let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby         let g:rubycomplete_classes_in_global = 1

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Let tab work in Markdown files
au FileType markdown,html,eruby inoremap <Tab> <Tab>

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
" => BufferExplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1
if &diff
  let g:miniBufExplorerMoreThanOne=3
else
  let g:miniBufExplorerMoreThanOne=2
end
"let g:miniBufExplModSelTarget = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extras
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! BufWritePost .vimrc source % "Reload .vimrc on save

let g:markdown_extensions=["md", "markdown"]
let g:gist_clip_command = 'xclip -selection clipboard'

" Syntastic
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'

let g:syntastic_style_warning_symbol = '≈≈'

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

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

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
