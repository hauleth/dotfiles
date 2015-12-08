function work
  set NAME $argv[1]

  if not tmux has-session -t "$NAME" ^/dev/null
    tmux  start-server \;\
      new-session -d -s "$NAME" -c "$HOME/Workspace/$NAME"
  end
  tmux attach -t "$NAME"
end

complete -x -c work -a '(find -L ~/Workspace -depth -maxdepth 5 -type d -and -name .git -prune -and -not -path "*/\.cargo/*" -prune -printf "%h\n" | sed -e "s:$HOME/Workspace/::" -e "s:/\.git::")'
