LNFLAGS = -sf
export LN = ln $(LNFLAGS)

export WGET = wget -Nqnv

export PWD = $(shell pwd)

TARGETS ?= fish bin nvim git ruby utils iterm2 ctags

all: $(TARGETS)

$(TARGETS):
	$(MAKE) -C $@ install

update:
	@git submodule foreach git pull

.PHONY: $(TARGETS) all
