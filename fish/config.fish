alias ssh='env TERM=xterm-256color ssh'

function enable
    available "$argv[1]"
    and source (eval "$argv" | psub)
end

alias git=hub
source (direnv hook fish | psub)

set fish_user_paths ~/Workspace/hauleth/dotfiles/bin \
                    ~/.bin \
                    ~/.cargo/bin \
                    ~/.mix \
                    /usr/local/opt/gettext/bin

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
