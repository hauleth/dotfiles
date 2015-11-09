LNFLAGS = -rsiT
export LN = ln $(LNFLAGS)

export WGET = wget -Nq --show-progress

export XDG_CONFIG_HOME ?= ${HOME}/.config

all: nvim lein tmux

git:
	git config --global include.path '~/.dotfiles/git/config'

nvim:
	$(MAKE) -C $@ install

lein:
	$(WGET) -Obin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x bin/lein

tmux:
	$(MAKE) -C $@ install

.PHONY: tmux lein nvim all git
