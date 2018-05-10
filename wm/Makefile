PWD = $(shell pwd)
UTILS = chunkwmrc skhdrc

$(UTILS):
	$(LN) ${PWD}/$@ ${HOME}/.$@

install: $(UTILS)

clear:
	for util in $(UTILS); do rm ${HOME}/.$$util; done

.PHONY: install clear $(UTILS)
