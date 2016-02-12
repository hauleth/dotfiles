rec {
  allowUnfree = true;

  packageOverrides = pkgs: rec {
    all = pkgs.buildEnv {
      name = "all";
      paths = [
        pkgs.nix
        pkgs.nixops
        editors
        scm
        tools
      ];
    };

    editors = pkgs.buildEnv {
      name = "editors";
      paths = [
        pkgs.neovim
      ];
    };

    scm = pkgs.buildEnv {
      name = "scm";
      paths = [
        pkgs.mercurial

        pkgs.git
        pkgs.gitAndTools.hub
        pkgs.gitAndTools.git-imerge
      ];
    };

    tools = pkgs.buildEnv {
      name = "tools";
      paths = [
        pkgs.wrk
        pkgs.tmux

        # CLI tools
        pkgs.tldr
        pkgs.direnv
        pkgs.silver-searcher
        pkgs.jq
        pkgs.python35Packages.pygments

        universal-ctags
      ];
    };

    universal-ctags = pkgs.callPackage ./pkgs/universal-ctags {};
    htop = pkgs.callPackage ./pkgs/htop {};
  };
}
