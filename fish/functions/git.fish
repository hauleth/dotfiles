function git --description 'Git wrapper that run hub fi avaliable'
  if which hub ^/dev/null >/dev/null
    hub $argv
  else
    command git $argv
  end
end
