function work
  set NAME $argv[1]

  if not tmux has-session -t "$NAME" ^/dev/null
    tmux  start-server \;\
      new-session -d -s "$NAME" -c "$HOME/Workspace/$NAME"
  end
  tmux attach -t "$NAME"
end

complete -x -c work -a '(find -L ~/Workspace -depth -maxdepth 3 -name .git -type d | sed -e "s:$HOME/Workspace/::" -e "s:/\.git::" | grep -v "\.")'
