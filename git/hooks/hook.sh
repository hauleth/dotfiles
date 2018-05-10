#!/bin/bash

hooks=(post-checkout post-commit post-merge pre-commit pre-push prepare-commit-msg)

usage() {
    echo "$0 [install|help]"
    echo
    echo "Simple git hooks management system"
    echo
}

install() {
    source="${BASH_SOURCE[0]}"
    DIR="${1:-"$(git rev-parse --show-toplevel)"}"
    HOOK_DIR="${2:-"$DIR/.git/hooks"}"

    echo "Install handler"
    echo

    mkdir -p "$HOOK_DIR"
    cp -i "$0" "$HOOK_DIR/hook.sh"

    echo "Installing hooks"
    echo

    for hook in "${hooks[@]}"
    do
        echo "Installing $hook"
        ln -si "hook.sh" "$HOOK_DIR/$hook"
    done
}

hook() {
    script="$(basename "$0")"
    PLUG_DIRS=("$(command git config --get hooks.path)" "$GIT_DIR/hooks/hooks.d")

    echo "## Hook $script"
    echo

    test -d "$GIT_DIR"/rebase-merge -o -d "$GIT_DIR"/rebase-apply && exit 0

    for dir in "${PLUG_DIRS[@]}"
    do
        if [ -d "$dir" ]
        then
            find "$dir" -depth 2 -and -name "$script" -print0 2>/dev/null \
                | xargs -t0 -n1 -I_ sh -c '[ -x "$1" ] && printf "\n###### %s\n" "$1" && "$@" && echo "ok"' -- _ "$@"

            if [ ! "$?" -eq 0 ]
            then
                return "$?"
            fi
        fi
    done
}

case "$1" in
    install)
        shift
        install
        exit 0
        ;;
    help)
        shift
        usage
        exit
        ;;
    *)
        hook "$@"
esac
