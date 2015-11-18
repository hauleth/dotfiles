unbind C-b
set -g prefix C-q

set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
set -g mouse-utf8 on

set -g set-titles on

source "$HOME/.tmux/themes/agnoster.tmux"

# Smart pane switching with awareness of vim splits
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
bind -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

# Allow sending prefix to child
bind-key j    command-prompt -p "Join pane from:" "join-pane -s '%%'"
bind-key s    command-prompt -p "Send pane to:"   "join-pane -t '%%'"

set -g @sidebar-tree-command 'tree -C -I "tmp|vendor/bundle|target|node_modules"'

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'tmux-plugins/tmux-sessionist'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-sidebar'

# Initialize TMUX plugin manager
run "$HOME/.tmux/plugins/tpm/tpm"

# vim: ft=tmux
