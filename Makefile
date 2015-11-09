LNFLAGS = -rsiT
export LN = ln $(LNFLAGS)
export PWD = $(shell pwd)
WGET = wget -Nq --show-progress
TARGETS = nvim tmux git conky

all: $(TARGETS) lein

$(TARGETS):
	$(MAKE) -C $@ install

lein:
	$(WGET) -Obin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x bin/lein

.PHONY: $(TARGETS) lein all
