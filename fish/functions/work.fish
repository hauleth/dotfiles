function work
  set NAME $argv[1]

  tmux has-session -t "$NAME"
  or tmux new-session -d -s "$NAME" -c "$WORKSPACE/$NAME"
  if [ -z "$TMUX" ]
    tmux -CC attach-session -t "$NAME"
  else
    tmux switch-client -t "$NAME"
  end
end
