#!/bin/bash

DIR="$(dirname "$0")"

GIT_WORK_TREE="$DIR" git submodules foreach git pull && \
  git add -A "$DIR/vim/bundle" && \
  git commit -m "Update plugins $(date +%F)"
