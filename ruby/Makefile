PWD = $(shell pwd)

install:
	$(LN) ${PWD}/pryrc ${HOME}/.pryrc
	$(LN) ${PWD}/gemrc ${HOME}/.gemrc

clean:
	rm ${HOME}/.pryrc ${HOME}/.gemrc

.PHONY: install clean
