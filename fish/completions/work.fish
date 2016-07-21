complete -x -c work -a '(find "$WORKSPACE" -maxdepth 3 -type d -and -name .git -prune -print | sed -e "s:$WORKSPACE/*::" -e "s:/\.git::")'
