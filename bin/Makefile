FILES = lein git-imerge docker-compose docker-machine

PWD = $(shell pwd)

install: $(FILES) pip
	$(LN) ${PWD} ${HOME}/.local/bin

lein:
	$(WGET) -O$@ https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x $@

git-imerge:
	$(WGET) -O$@ https://raw.githubusercontent.com/mhagger/git-imerge/master/git-imerge
	chmod +x $@

pip:
	pip install --user --upgrade httpie patool

docker-compose:
	$(WGET) -O$@ https://github.com/docker/compose/releases/download/1.5.1/docker-compose-$(shell uname -s)-$(shell uname -m)
	chmod +x $@

docker-machine:
	$(WGET) -O$@.zip https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_linux-amd64.zip
	unzip -f $@.zip

.PHONY: pip $(FILES)
