XDG_CONFIG_HOME ?= ${HOME}/.config

PWD = $(shell pwd)

install:
	$(LN) ${PWD} $(XDG_CONFIG_HOME)/fish
	fish -c 'fin'

functions/fin.fish:
	$(WGET) -O$@ https://raw.githubusercontent.com/fisherman/fin/master/fin.fish

.PHONY: install
