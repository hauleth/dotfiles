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

if type nix-locate ^/dev/null >/dev/null
    function nix_locate_bin --on-event fish_command_not_found
        if not test -t 1
            __fish_default_command_not_found_handler $argv[1]
        end

        set -l cmd $argv[1]
        set -l attrs (nix-locate --minimal --no-group --type x --type s --top-level --whole-name --at-root "/bin/$cmd")

        switch (count $attrs)
            case 0
                echo "$cmd: command not found" >&2
            case 1
                echo "Found one package with $cmd, trying to run in 1s" >&2
                sleep 1
                if nix-build --no-out-link -A $attrs "<nixpkgs>"
                    nix-shell -p $attrs --run (printf "'%s' " $argv)
                    return
                else
                    echo "Failed to install nixpkgs.$attrs"
                    echo "$cmd: command not found"
                end
            case '*'
                echo "$cmd is not installed. You can find it in:" >&2
                printf "\tnix-env -iA nixpkgs.%s\n" $attrs >&2
        end
    end
end

if status --is-interactive
    # env SHELL=fish keychain --eval --quiet -Q | source

    kitty + complete setup fish | source
end
