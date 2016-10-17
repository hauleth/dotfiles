if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'hauleth/agnoster'
fundle plugin 'tuvistavie/fish-fastdir'

fundle init

alias ssh="env TERM=xterm-256color ssh"

if status --is-interactive
    enable direnv hook fish
    enable hub alias -s
    enable jump shell fish
    enable rbenv init -

    test -e {$HOME}/.iterm2_shell_integration.fish
    and source {$HOME}/.iterm2_shell_integration.fish
end
