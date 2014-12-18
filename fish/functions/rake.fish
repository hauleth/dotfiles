function rake
  if [ -d './bin' ]
    ./bin/rake $argv
  else
    bundle exec rake $argv; or command rake
  end
end
