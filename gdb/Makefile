dashboard:
	$(WGET) -O$@ http://git.io/.gdbinit

install: dashboard
	$(LN) dashboard ${HOME}/.gdbinit

clean:
	rm ${HOME}/.gdbinit

.PHONY: dashboard install clean
