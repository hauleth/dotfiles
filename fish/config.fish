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
set -gx NIX_PATH nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs

set fisher_home $DOTFILES/fish/fisherman
set fisher_config $HOME/.config/fisherman
source $fisher_home/config.fish

theme base16-ocean dark

# set fish_greeting (fortune zen)

enable direnv hook fish
enable hub alias -s
enable jump shell fish
enable rbenv init -
enable thefuck --alias

agnoster powerline
