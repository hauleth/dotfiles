function p
    if test (count $argv) -gt 0 && test -f $argv[1] || not isatty
        bat $argv
    else
        ls -Alh $argv
    end
end
