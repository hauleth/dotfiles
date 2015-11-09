UTILS = dir_colors ctags

$(UTILS):
	$(LN) $@ ${HOME}/.$@

install: dir_colors ctags

clear:
	for util in $(UTILS); do rm $$util; done

.PHONY: install clear ctags dir_colors
