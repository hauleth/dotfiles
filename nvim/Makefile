XDG_CONFIG_HOME ?= ${HOME}/.config

install:
	$(LN) nvim $(XDG_CONFIG_HOME)/nvim
	# nvim +PlugUpdate +qall # Currently doesn't work
	@echo 'Run NeoVim and execute `:PlugInstall`'

clean:
	rm $(XDG_CONFIG_HOME)/nvim

.PHONY: install clean
