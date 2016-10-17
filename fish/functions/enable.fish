function enable
    available "$argv[1]"
    and source (eval "$argv" | psub)
end
