function serve --description 'Create simple static files server'
  # ruby -run -e httpd . -p 8000 $argv
  busybox httpd -f -p 8000 $argv
end
