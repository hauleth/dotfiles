function stop
  kill -9 (ps ax | grep $argv[1] | grep -v 'grep' | awk '{print $1}')
end
