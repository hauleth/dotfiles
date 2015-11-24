set fish_greeting (fortune zen)
# set fish_key_bindings fish_vi_key_bindings

set -x PATH $HOME/.local/bin $GOPATH/bin $HOME/.cabal/bin $PATH

set NIX_LINK "$HOME/.nix-profile"

# Set the default profile.
if not [ -L "$NIX_LINK" ]
  echo "creating $NIX_LINK" >&2
  set _NIX_DEF_LINK /nix/var/nix/profiles/default
  /nix/store/4lrli8ng5i54k14id152svvp1kvqsn92-coreutils-8.21/bin/ln -s "$_NIX_DEF_LINK" "$NIX_LINK"
end

set -x PATH $NIX_LINK/bin $NIX_LINK/sbin $PATH

# Append ~/.nix-defexpr/channels/nixpkgs to $NIX_PATH so that
# <nixpkgs> paths work when the user has fetched the Nixpkgs
# channel.
set -x NIX_PATH nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs

available hub; and eval (hub alias -s)

if [ -z "$TMUX" ]
  set -gx TERM xterm-256color
else
  set -gx TERM screen-256color
end

agnoster_powerline
