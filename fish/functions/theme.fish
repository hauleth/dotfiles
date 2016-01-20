set THEME_PATH $DOTFILES/fish/base16

function theme
  eval sh "$THEME_PATH"/"$argv[1]"."$argv[2]".sh
end
