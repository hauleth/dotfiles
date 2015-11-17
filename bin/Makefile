FILES = lein git-imerge docker-compose

install: $(FILES) pip
	$(LN) . ${HOME}/.local/bin

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

.PHONY: pip $(FILES)
