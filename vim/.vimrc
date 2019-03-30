let s:config_dir = exists('$XDG_CONFIG_DIR') ? $XDG_CONFIG_DIR : $HOME . '/.config'
let s:data_dir = exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . '/.local/share'

exec 'set runtimepath^='.s:config_dir.'/nvim,'.s:data_dir.'/nvim/site'
exec 'set packpath^='.s:data_dir.'/nvim/site'

syntax on
filetype plugin indent on

set laststatus=2
set wildmenu

runtime init.vim
