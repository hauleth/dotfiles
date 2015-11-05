LNFLAGS=-rsiT
LN=ln $(LNFLAGS)

WGET=wget

XDG_CONFIG_HOME ?= ${HOME}/.config

all: neovim lein tmux

neovim:
	$(LN) nvim $(XDG_CONFIG_HOME)/nvim
	nvim +PlugUpgrade +PlugInstall +qall

lein:
	$(WGET) -Obin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x bin/lein

tmux:
	$(LN) tmux.conf ${HOME}/.tmux.conf
	$(LN) tmux ${HOME}/.tmux
