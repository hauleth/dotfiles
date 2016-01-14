#!/bin/bash

script="$(basename "$0")"

test -d "$GIT_DIR"/rebase-merge -o -d "$GIT_DIR"/rebase-apply && exit 0
for enabled_plugin in $(git config --get-all hooks.enabled-plugins)
do
  if [ -x "$GIT_DIR/hooks/$enabled_plugin/$script" ]
  then
    "$GIT_DIR/hooks/$enabled_plugin/$script" "$@" || exit $?
  fi
done
