#!/bin/bash

DIR="$(dirname "$0")"

echo "Update files in: $DIR"

export GIT_DIR="$DIR/.git"
export GIT_WORK_TREE="$DIR"
git submodule foreach git pull
git add -A "$DIR/vim/bundle"
git commit -m "Update plugins $(date +%F)"
