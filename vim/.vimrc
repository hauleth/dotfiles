let s:config_dir = exists('$XDG_CONFIG_DIR') ? $XDG_CONFIG_DIR : $HOME . '/.config'

exec 'set runtimepath^='.s:config_dir.'/nvim'

runtime init.vim
