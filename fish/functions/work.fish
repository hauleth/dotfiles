function work
  set NAME $argv[1]

  pushd "$HOME/Workspace/$NAME"

  if not tmux has-session -t "$NAME" ^/dev/null
    tmux start \;\
      new-session -d -s "$NAME"
  end

  tmux attach -t "$NAME"

  popd
end
