if not functions -q fundle
  eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'hauleth/agnoster'
fundle plugin 'fishery/rbenv'
fundle plugin 'fishery/z'

fundle init

enable direnv hook fish
enable hub alias -s
enable jump shell fish
enable rbenv init -
enable thefuck --alias
