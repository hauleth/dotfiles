install:
	git config --global include.path "$(PWD)/git/config"
	git config --global core.excludesfile "$(PWD)/git/ignore"

clean:
	git config --global --unset include.path
	git config --global --unset core.excludesfile

.PHONY: install clean
