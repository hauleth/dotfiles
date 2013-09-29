set -g status-fg colour231
set -g status-bg colour234
set -g status-left-length 20
set -g status-left '#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour234,nobold]'
set -g status-right '#[fg=colour236,bg=default,nobold,noitalics,nounderscore] #[fg=colour247,bg=colour236,nobold,noitalics,nounderscore] ⌚ #(date +"%D")#[fg=colour241,bg=colour236,nobold,noitalics,nounderscore] #[fg=colour252,bg=colour236,bold,noitalics,nounderscore] ⌚ #(date +"%H:%M")#[fg=colour252,bg=colour236,nobold,noitalics,nounderscore] #[fg=colour16,bg=colour252,bold,noitalics,nounderscore] #(uname -n) '
set -g status-right-length 150

set -g window-status-format "#[fg=colour244,bg=colour234]#I #[fg=colour240] #[default]#W "
set -g window-status-current-format "#[fg=colour234,bg=colour31]#[fg=colour117,bg=colour31] #I  #[fg=colour231,bold]#W #[fg=colour31,bg=colour234,nobold]"

set-window-option -g window-status-fg colour249
set-window-option -g window-status-activity-attr none
set-window-option -g window-status-bell-attr none
set-window-option -g window-status-activity-fg yellow
set-window-option -g window-status-bell-fg red

# vim: ft=tmux
