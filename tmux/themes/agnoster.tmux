set -g status-fg colour231
set -g status-fg colour231
set -g status-bg colour234
set -g status-left-length 20
set -g status-left '#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour234,nobold]'
set -g status-right '#(eval tmux-airline `tmux display -p "#{client_width}"`)'
set -g status-right-length 150

set -g window-status-format "#[fg=colour244,bg=colour234]#I #[fg=colour240] #[default]#W "
set -g window-status-current-format "#[fg=colour234,bg=colour31]#[fg=colour117,bg=colour31] #I  #[fg=colour231,bold]#W #[fg=colour31,bg=colour234,nobold]"

set-window-option -g window-status-fg colour249
set-window-option -g window-status-activity-attr none
set-window-option -g window-status-bell-attr none
set-window-option -g window-status-activity-fg yellow
set-window-option -g window-status-bell-fg red
set -g status-bg colour234
set -g status-left-length 20
set -g status-left '#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour234,nobold]'
set -g status-right '#(eval tmux-airline `tmux display -p "#{client_width}"`)'
set -g status-right-length 150

set -g window-status-format "#[fg=colour244,bg=colour234]#I #[fg=colour240] #[default]#W "
set -g window-status-current-format "#[fg=colour234,bg=colour31]#[fg=colour117,bg=colour31] #I  #[fg=colour231,bold]#W #[fg=colour31,bg=colour234,nobold]"

set-window-option -g window-status-fg colour249
set-window-option -g window-status-activity-attr none
set-window-option -g window-status-bell-attr none
set-window-option -g window-status-activity-fg yellow
set-window-option -g window-status-bell-fg red

# vim: ft=tmux
