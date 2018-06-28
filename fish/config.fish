alias ssh='env TERM=xterm-256color ssh'

alias git=hub
source (direnv hook fish | psub)

set -x LESS '-SRFXi'
set -x ERL_AFLAGS '-kernel shell_history enabled'

set fish_user_paths ~/Workspace/hauleth/dotfiles/bin \
                    ~/.cargo/bin \
                    /usr/local/opt/gettext/bin \
                    ~/.cache/rebar3/bin/

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'hauleth/agnoster'
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin 'tuvistavie/fish-asdf'

fundle init

if status --is-interactive
    keychain --eval --quiet -Q id_ed25519 | source
end
