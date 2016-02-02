FILES = docker-compose docker-machine

PWD = $(shell pwd)

install: $(FILES)

lein:
	$(WGET) -O$@ https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x $@

docker-compose:
	$(WGET) -O$@ https://github.com/docker/compose/releases/download/1.5.1/docker-compose-$(shell uname -s)-$(shell uname -m)
	chmod +x $@

docker-machine:
	$(WGET) -O$@.zip https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_linux-amd64.zip
	unzip -f $@.zip

nvr:
	$(WGET) -O$@ https://raw.githubusercontent.com/mhinz/neovim-remote/master/nvr
	chmod +x $@

.PHONY: $(FILES)
