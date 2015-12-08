" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir -p ~/.cache/backups > /dev/null 2>&1
set undodir=~/.cache/backups
set undofile
