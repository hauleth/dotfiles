alias git=hub
source (direnv hook fish | psub)

set -x LESS '-SRFXi'
set -x ERL_AFLAGS '-kernel shell_history enabled'
set -x KERL_CONFIGURE_OPTIONS --without-javac --with-dynamic-trace=dtrace
set CDPATH . "$HOME/Workspace"

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'hauleth/agnoster'
fundle plugin 'tuvistavie/fish-asdf'
fundle plugin 'edc/bass'

fundle init

bass source ~/.nix-profile/etc/profile.d/nix.sh

set fish_user_paths ~/bin ~/.cargo/bin ~/.cache/rebar3/bin

if status --is-interactive
    env SHELL=fish keychain --eval --quiet -Q id_ed25519 | source

    kitty + complete setup fish | source
end

set -gx CPPFLAGS $CPPLFAGS -I/usr/local/opt/openssl/include
set -gx LDLIBS $LDLIBS -I/usr/local/opt/openssl/lib

source ~/.asdf/asdf.fish
