function rails
  if [ -d './bin' ]
    ./bin/rails $argv
  else
    if not bundle exec rails $argv
      echo 'You are not in Rails project'
      return 1
    else
      return $status
    end
  end
end
