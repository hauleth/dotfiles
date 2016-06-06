FILES = lein

PWD = $(shell pwd)

install: $(FILES)

lein:
	$(WGET) -O$@ https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x $@

nvr:
	$(WGET) -O$@ https://raw.githubusercontent.com/mhinz/neovim-remote/master/nvr
	chmod +x $@

.PHONY: $(FILES)
