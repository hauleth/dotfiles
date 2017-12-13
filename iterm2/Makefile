ITERM2_CONFIG_PATH ?= ${HOME}/Library/Preferences

PWD = $(shell pwd)

install: terminfo blame.itermcolors
	cp ${PWD}/com.googlecode.iterm2.plist ${ITERM2_CONFIG_PATH}/

terminfo: xterm-256color.terminfo
	tic -o ${HOME}/.terminfo $<

clean:
	rm ${ITERM2_CONFIG_PATH}/com.googlecode.iterm2.plist

blame.itermcolors:
	wget -O$@ https://raw.githubusercontent.com/hauleth/blame.vim/master/terminal_colors/sidonia.itermcolors

.PHONY: install clean terminfo
