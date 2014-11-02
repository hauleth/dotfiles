#!/bin/bash

old="$(pwd)"

dir="$(dirname "$0")"

echo "Update files in: $dir"

cd $dir

git submodule foreach git pull &&\
  git add -A "$dir/vim/bundle" &&\
  git commit -m "Update plugins $(date +%F)"
