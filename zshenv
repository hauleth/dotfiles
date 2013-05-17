export JRUBY_OPTS=--1.9

# Customize to your needs...
export PATH=/home/hauleth/.bin/:"$(npm bin)":$PATH

export EDITOR='gvim -f'
export SUDO_EDITOR='gvim -f'

eval "$(rbenv init -)"
