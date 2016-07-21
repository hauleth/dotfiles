set -g status-fg colour21
set -g status-bg colour00

set -g status-left-length 30
set -g status-left '#[fg=colour00,bg=colour08,nobold] #S #[fg=colour08,bg=colour00,nobold]'

set -g status-right '#(eval tmux-airline #{client_width})'
set -g status-right-length 150

set -g window-status-format "#[fg=colour08,bg=colour00] #I  #W#[default]"
set -g window-status-current-format "#[fg=colour00,bg=colour08] #[fg=colour00]#I  #W #[fg=colour08,bg=colour00,nobold]"

set-window-option -g window-status-fg colour08
set-window-option -g window-status-activity-attr none
set-window-option -g window-status-bell-attr none
set-window-option -g window-status-activity-fg yellow
set-window-option -g window-status-bell-fg red

# vim: ft=tmux
