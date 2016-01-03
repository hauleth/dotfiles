function work
  set NAME $argv[1]

  mkdir -p (dirname "/tmp/work/$NAME")
  set -x NVIM_LISTEN_ADDRESS "/tmp/work/$NAME"

  if not tmux has-session -t "$NAME" ^/dev/null
    tmux  start-server \;\
      new-session -d -s "$NAME" -c "$WORKSPACE_SRC/$NAME"
  end
  tmux attach -t "$NAME"
end
