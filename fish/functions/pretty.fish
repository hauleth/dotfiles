function pretty --wrap highlight
    highlight -O ansi --force --stdout $argv | less -RS
end
