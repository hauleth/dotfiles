XDG_CONFIG_HOME ?= ${HOME}/.config

PWD = $(shell pwd)

install:
	$(LN) ${PWD} $(XDG_CONFIG_HOME)/fish
	fish -c 'fundle install'

.PHONY: install
