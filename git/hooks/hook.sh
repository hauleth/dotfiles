#!/bin/bash

script="$(basename "$0")"
HOOKS_DIR="$(command git config --get core.hooksPath || echo "$GIT_DIR/hooks")"
PLUGS_DIR="$HOOKS_DIR/plugs"

test -d "$GIT_DIR"/rebase-merge -o -d "$GIT_DIR"/rebase-apply && exit 0
find "$PLUGS_DIR" -depth 2 -and -name "$script" -print0 |  \
    xargs -0 -n1 sh -c '"$1" && echo "$(basename "$(dirname "$1")"): ok"' --
