PWD = $(shell pwd)

install:
	$(LN) ${PWD}/init.tmux ${HOME}/.tmux.conf
	$(LN) ${PWD} ${HOME}/.tmux

clean:
	rm ${HOME}/.tmux.conf ${HOME}/.tmux

.PHONY: install clean
