function rake
    if begin
            [ -d './bin' ]
            and [ -x './bin/rake' ]
        end
        ./bin/rake $argv
    else
        bundle exec rake $argv
        or command rake
    end
end
