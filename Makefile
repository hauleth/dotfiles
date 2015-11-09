LNFLAGS = -rsiT
export LN = ln $(LNFLAGS)

export WGET = wget -Nq --show-progress

export PWD = $(shell pwd)
TARGETS = nvim tmux git conky gdb

all: $(TARGETS) lein

$(TARGETS):
	$(MAKE) -C $@ install

lein:
	$(WGET) -Obin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x bin/lein

.PHONY: $(TARGETS) lein all
