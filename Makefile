TARGETS ?= vim wm misc

all: nix $(TARGETS)

nix:
	@printf "%s\t" $@
	@printf "\033[32m✓" || printf "\033[31m✗"
	@printf "\033[m\n"
	@nix run '.#system' -- switch
	@nix run '.#home' -- switch

$(TARGETS): check
	@printf "%s\t" $@
	@stow -t "${HOME}" -R "$@" 2> /dev/null && printf "\033[32m✓" || printf "\033[31m✗"
	@printf "\033[m\n"

check:
	@if ! which stow 2>/dev/null >/dev/null; \
		then printf "\033[31mGNU Stow not found\033[m\n"; \
		exit 1; fi

.PHONY: $(TARGETS) nix all
