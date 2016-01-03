function e --wraps "nvim"
  if [ (count $argv) -eq 0 ]
    set -l f (tempfile)
    fzf --prompt="edit: " > "$f"; or exit
    set argv (cat "$f")
    rm "$f"
  end

  nvim $argv
end
