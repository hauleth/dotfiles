function e -d "Run $EDITOR with given file" --wraps $EDITOR
  eval "$EDITOR $argv"
end
