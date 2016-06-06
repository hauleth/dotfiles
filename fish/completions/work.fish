complete -x -c work -a '(find -L "$WORKSPACE" -depth -maxdepth 5 -type d -and -name .git -prune -and -not -path "*/\.cargo/*" -prune -print | sed -e "s:$WORKSPACE/*::" -e "s:/\.git::")'
