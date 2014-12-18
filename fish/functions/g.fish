function g --description 'Shortcut for Git. Less typing, more work' --wraps git
  if which hub ^/dev/null >/dev/null
    hub $argv
  else
    git $argv
  end
end
