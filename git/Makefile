PWD = $(shell pwd)

install:
	git config --global include.path "$(PWD)/config"
	git config --global core.excludesfile "$(PWD)/ignore"
	git config --global core.hooksPath "$(PWD)/hooks"

clean:
	git config --global --unset include.path
	git config --global --unset core.excludesfile
	git config --global --unset init.templatedir

.PHONY: install clean
