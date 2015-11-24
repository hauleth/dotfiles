function e --wraps "$EDITOR"
  if [ (count $argv) = 0 ]
    set -l f (tempfile)
    fzf > $f; or exit
    set argv $argv (cat $f)
  end
  eval "$EDITOR $argv"
end
