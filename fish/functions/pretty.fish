function pretty
    pygmentize -f terminal -g $argv | less -RS
end
