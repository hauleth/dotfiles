PWD = $(shell pwd)

install: dashboard
	$(LN) ${PWD}/dashboard ${HOME}/.gdbinit

dashboard:
	$(WGET) -O$@ http://git.io/.gdbinit

clean:
	rm ${HOME}/.gdbinit

.PHONY: dashboard install clean
