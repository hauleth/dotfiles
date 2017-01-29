#!/bin/sh

script="$(basename "$0")"
PLUGS_DIR="$GIT_DIR/hooks/plugs"

test -d "$GIT_DIR"/rebase-merge -o -d "$GIT_DIR"/rebase-apply && exit 0
for plugin in "$PLUGS_DIR"/*
do
  if [ -x "$PLUGS_DIR/$plugin/$script" ]
  then
    "$PLUGS_DIR/$plugin/$script" "$@" || exit $?
  fi

  echo "$plugin $script: ok"
done
