LNFLAGS = -rsiT
export LN = ln $(LNFLAGS)

export WGET = wget -Nq --show-progress

export PWD = $(shell pwd)

TARGETS ?= nvim tmux git conky gdb ruby utils bin fish

all: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@ install

update:
	@git submodule foreach git pull

.PHONY: $(TARGETS) all
