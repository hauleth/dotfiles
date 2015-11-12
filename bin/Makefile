install: lein git-imerge pip
	$(LN) . ${HOME}/.local/bin

lein:
	$(WGET) -O./lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x ./lein

git-imerge:
	$(WGET) -O./git-imerge https://raw.githubusercontent.com/mhagger/git-imerge/master/git-imerge
	chmod +x ./git-imerge

pip:
	pip install --user --upgrade httpie patool

.PHONY: lein git-imerge
