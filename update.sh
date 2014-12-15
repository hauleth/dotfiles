#!/bin/bash

dir="$(dirname "$0")"
echo "Update files in: $dir"

cd "$dir"
peru reup &&\
  git add -A "peru.yaml" &&\
  git commit -m "Update plugins $(date +%F)"
cd "$OLDPWD"
