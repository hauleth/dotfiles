function work
  set project (basename (command git rev-parse --show-toplevel))
  time -f '%E'  -- tmux new -s $project; or time -f '%E' -- tmux attach -t $project
end
