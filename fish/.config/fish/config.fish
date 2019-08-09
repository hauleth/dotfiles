alias git=hub
source (direnv hook fish | psub)

if test "$EDITOR" = nano
    set -x EDITOR nvim
end

set -x LESS '-SRFXi'
set -x ERL_AFLAGS '-kernel shell_history enabled'

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'hauleth/agnoster'

fundle init

ulimit -n 10480

set fish_user_paths ~/bin ~/.nix-profile/bin /run/current-system/sw/bin

if status --is-interactive
    env SHELL=fish keychain --eval --quiet -Q id_ed25519 | source

    kitty + complete setup fish | source
end
