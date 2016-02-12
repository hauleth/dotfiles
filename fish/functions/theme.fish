set THEME_PATH $DOTFILES/fish/base16

function theme
  if status --is-interactive
    eval sh "$THEME_PATH"/"$argv[1]"."$argv[2]".sh
  end
end
