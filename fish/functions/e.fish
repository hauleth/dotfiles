function e --wraps $EDITOR
    sh -c "$EDITOR \"\$@\"" -- $argv
end
