function e -d "Run $EDITOR with given file" --wraps $EDITOR
  set -x VIMRUNTIME /usr/share/vim/vim74/
  eval $EDITOR "$argv"
end
