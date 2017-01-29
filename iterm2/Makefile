ITERM2_CONFIG_PATH ?= ${HOME}/Library/Preferences

PWD = $(shell pwd)

install: terminfo
	cp ${PWD}/com.googlecode.iterm2.plist $(ITERM2_CONFIG_PATH)/

terminfo: xterm-256color-italic.terminfo
	tic $<

clean:
	rm $(ITERM2_CONFIG_PATH)/com.googlecode.iterm2.plist

.PHONY: install clean terminfo
