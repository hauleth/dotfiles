XDG_CONFIG_HOME ?= ${HOME}/.config

PWD = $(shell pwd)

install: fin
	$(LN) ${PWD} $(XDG_CONFIG_HOME)/fish

functions/fin.fish:
	$(WGET) -O$@ https://raw.githubusercontent.com/fishery/fin/master/fin.fish

fin: functions/fin.fish
	fish -c 'fin'

.PHONY: install
