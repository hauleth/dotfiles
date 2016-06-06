function fish_user_key_bindings
  bind \e\e 'thefuck-command-line'  # Bind EscEsc to thefuck
  bind \cf 'thefuck-command-line'  # Bind EscEsc to thefuck

  fish_vi_key_bindings
  fzf_key_bindings
end
