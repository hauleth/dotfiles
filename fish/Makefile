install:
	$(WGET) -O- https://raw.githubusercontent.com/wa/wahoo/master/bootstrap.sh | sh || true
	$(MAKE) plugins

plugins: install.fish
	fish "$<"

.PHONY: install
