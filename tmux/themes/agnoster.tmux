set -g status-fg colour21
set -g status-bg colour00

set -g status-left-length 30
set -g status-left '#[fg=colour18,bg=colour21,bold] #S #[fg=colour21,bg=colour00,nobold]'

set -g status-right '#(eval tmux-airline `tmux display -p "#{client_width}"`)'
set -g status-right-length 150

set -g window-status-format "#[fg=colour19,bg=colour00] #I  #W#[default]"
set -g window-status-current-format "#[fg=colour00,bg=colour19]#[fg=colour21] #I  #[bold]#W #[fg=colour19,bg=colour00,nobold]"

set-window-option -g window-status-fg colour21
set-window-option -g window-status-activity-attr none
set-window-option -g window-status-bell-attr none
set-window-option -g window-status-activity-fg yellow
set-window-option -g window-status-bell-fg red

# vim: ft=tmux
