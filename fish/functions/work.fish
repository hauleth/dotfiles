function work
  set NAME $argv[1]

  tmux new-session -A -s "$NAME" -c "$WORKSPACE_SRC/$NAME" ^/dev/null
  if [ ! -z "$TMUX" ]
    tmux switch-client -t "$NAME"
  end
end
