PWD = $(shell pwd)
UTILS = dir_colors ctags

$(UTILS):
	$(LN) ${PWD}/$@ ${HOME}/.$@

install: dir_colors ctags

clear:
	for util in $(UTILS); do rm ${HOME}/.$$util; done

.PHONY: install clear ctags dir_colors
