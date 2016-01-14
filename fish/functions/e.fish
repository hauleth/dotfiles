function e --wraps "nvim"
  if [ (count $argv) -eq 0 ]
    fzf-tmux --multi --prompt="edit: " | read argv
  end

  nvim $argv
end
