#!/bin/bash

hooks=(post-checkout post-commit post-merge pre-commit pre-push prepare-commit-msg)

usage() {
    echo "$0 [install|help]"
    echo 'Version 0.1.0'
    echo 'Copyright (c) Łukasz Niemier <opensource@niemier.pl>'
    echo
    echo 'Simple git hooks management system'
    echo
    echo 'install [hook_dir]'
    echo '    Installs hooks for given repo.'
    echo
    echo '    [hook_dir] - directory where install hooks, defaults to .git/hooks'
    echo '                 in current Git working directory'
    echo 'help'
    echo '    display this message'
    echo
    echo 'To use this as default set of hooks when creating new repo then:'
    echo
    echo "    1. Run '$0 ~/.githooks'"
    echo '    2. Run 'git config --global core.hooksPath ~/.githooks''
    echo
}

install() {
    source="${BASH_SOURCE[0]}"
    HOOK_DIR="${1:-"$(git rev-parse --show-toplevel)/.git/hooks"}"

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

    test -d "$GIT_DIR"/rebase-merge -o -d "$GIT_DIR"/rebase-apply && exit 0

    for dir in "${PLUG_DIRS[@]}"
    do
        if [ -d "$dir" ]
        then
            find "$dir" -depth 2 -and -name "$script" -print0 2>/dev/null \
                | xargs -0 -n1 -I_ sh -c 'if [ -x "$1" ]; then printf "\n###### %s\n" "$1" && "$@" && echo "ok"; fi' -- _ "$@"
            retval="$?"

            if [ ! "$retval" -eq 0 ]
            then
                return "$retval"
            fi
        fi
    done
}

case "$1" in
    install)
        shift
        install
        exit
        ;;
    help|-h|--help|version|-v|-V|--version)
        shift
        usage
        exit
        ;;
    *)
        hook "$@"
esac
