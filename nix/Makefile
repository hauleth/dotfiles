PWD = $(shell pwd)

NIX_LINK = ${HOME}/.nix-profile
NIX_DEFAULT = /nix/var/nix/profiles/default

install: nix channels
	$(LN) ${PWD} ${HOME}/.nixpkgs
	${NIX_LINK}/bin/nix-channel --update
	${NIX_LINK}/bin/nix-env -i runtime

nix: install.sh
	test -d "/nix" || sh install.sh

path:
	echo "Creating ${NIX_LINK}"
	/nix/store/4lrli8ng5i54k14id152svvp1kvqsn92-coreutils-8.21/bin/ln -s "${NIX_DEFAULT}" "${NIX_LINK}"
	export PATH=${NIX_LINK}/bin:${NIX_LINK}/sbin:${PATH}

channels:
	echo "http://nixos.org/channels/nixpkgs-unstable nixpkgs" > ${HOME}/.nix-channels
