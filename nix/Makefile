install: nix
	$(LN) . ${HOME}/.nixpkgs
	${HOME}/.nix-profile/bin/nix-channel --update
	${HOME}/.nix-profile/bin/nix-env -i homeEnv
	${HOME}/.nix-profile/bin/nix-collect-garbage -d

nix: install.sh
	test -d "/nix" || sh install.sh
