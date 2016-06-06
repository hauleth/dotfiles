XDG_CONFIG_HOME ?= ${HOME}/.config

PWD = $(shell pwd)

install:
	$(LN) ${PWD} $(XDG_CONFIG_HOME)/nvim
	nvim +PlugUpgrade +PlugInstall +qa # Currently doesn't work

clean:
	rm $(XDG_CONFIG_HOME)/nvim

.PHONY: install clean
