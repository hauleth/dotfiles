function most-used --description 'Print most used commands'
  history | awk '{print $1}' | sort | uniq -c | sort -rn | head $argv
end
