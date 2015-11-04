set fish_greeting (fortune zen)
# set fish_key_bindings fish_vi_key_bindings

set -gx PATH $HOME/.bin $HOME/.cabal/bin $PATH

if [ -z "$TMUX" ]
  set -gx TERM xterm-256color
else
  set -gx TERM screen-256color
end

agnoster_powerline
