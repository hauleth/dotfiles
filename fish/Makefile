XDG_CONFIG_HOME ?= ${HOME}/.config

PWD = $(shell pwd)

install:
	$(LN) ${PWD}/functions $(XDG_CONFIG_HOME)/fish/functions
	$(LN) ${PWD}/completions $(XDG_CONFIG_HOME)/fish/completions
	$(LN) ${PWD}/config.fish $(XDG_CONFIG_HOME)/fish/config.fish

.PHONY: install
