function ssh_agent
  if [ -z "$SSH_ENV" ]
    echo 'You must set $SSH_ENV variable to use ssh-agent in login shell'
    echo 'Otherwise you can run `exec ssh-agent fish` to use it'
    return 1
  end

  # Load old ssh-agent instance
  [ -f "$SSH_ENV" ]; and source "$SSH_ENV"

  # Check if agent is running
  ssh-add -l > /dev/null ^&1
  if [ ! $status -eq 0 ]
    echo "Setting up ssh-agent"

    # Run ssh-agent
    ssh-agent -c | sed 's/^echo/#echo/' > "$SSH_ENV"
    source "$SSH_ENV"

    # Add SSH identities
    ssh-add
  end
end
