ITERM2_CONFIG_PATH ?= ${HOME}/Library/Preferences

PWD = $(shell pwd)

install:
	$(LN) ${PWD}/com.googlecode.iterm2.plist $(ITERM2_CONFIG_PATH)/

clean:
	rm $(ITERM2_CONFIG_PATH)/com.googlecode.iterm2.plist

.PHONY: install clean
