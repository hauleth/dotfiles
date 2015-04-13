set -l configdir $HOME/.config/fish
set fish_greeting (fortune zen)

set theme agnoster

# Add local binaries to PATH
set -gx PATH \
  $HOME/.gobin \
  $HOME/.linuxbrew/bin \
  $HOME/.cabal/bin \
  $HOME/.bin \
  $HOME/.rbenv/bin \
  $HOME/.rks/bin \
  $PATH

# Setup SSH agent
set -gx SSH_ENV $HOME/.ssh/environment

ssh_agent

if [ -e "$TMUX" ]
  set -gx TERM xterm-256color
else
  set -gx TERM screen-256color
end

# Set dircolors
if [ -e "$HOME/.dir_colors" ]
  eval (dircolors -c "$HOME/.dir_colors")
end

[ -e $configdir/themes/$theme.fish ]; and source $configdir/themes/$theme.fish
[ -s $HOME/.nvm-fish/nvm.fish ]; and source $HOME/.nvm-fish/nvm.fish

# Init rbenv
source (rbenv init - | psub)
