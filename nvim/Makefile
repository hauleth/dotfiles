XDG_CONFIG_HOME ?= ${HOME}/.config

PWD = $(shell pwd)

install: python
	$(LN) ${PWD} $(XDG_CONFIG_HOME)/nvim
	# nvim +PlugUpdate +qall # Currently doesn't work
	@echo 'Run NeoVim and execute `:PlugInstall`'

clean:
	rm $(XDG_CONFIG_HOME)/nvim

python:
	pip install --user --upgrade neovim

.PHONY: install clean
