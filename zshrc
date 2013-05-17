# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
alias zshconfig="$EDITOR ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DEFAULT_USER='hauleth'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux heroku rbenv ruby rails3 bundler git)

setopt inc_append_history

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

alias xclip='xclip -selection clipboard'
alias pacman=pacman-color
alias e=$EDITOR
alias y=yaourt
alias mdp=markdown-preview
alias tree='tree -CF'

cless() {
  coderay $@ | less -R
}

pacman-by-size() {
  pacman -Qi | awk '/^Nazwa/ {pkg=$3} /Rozmiar/ {print $4$5,pkg}' | sort -n
}

sip() {
  if cd $1; then
    e .
  fi
}

# Wrap git automatically by adding the following to ~/.zshrc:
eval "$(hub alias -s)"
alias g=git

PLUGIN_PATH=$HOME/.zsh-plugins

for i in $(ls $PLUGIN_PATH)
do
  [[ -f $PLUGIN_PATH/$i ]] && . $PLUGIN_PATH/$i
done
