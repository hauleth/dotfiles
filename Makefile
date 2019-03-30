TARGETS ?= fish vim kitty git ctags wm misc

all: $(TARGETS)

$(TARGETS):
	@printf "%s\t" $@
	@stow -t "${HOME}" -R "$@" 2> /dev/null && printf "\033[32m✓" || printf "\033[31m✗"
	@printf "\033[m\n"

.PHONY: $(TARGETS) all
