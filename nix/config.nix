{
  packageOverrides = pkgs: rec {
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
        pkgs.silver-searcher
        pkgs.jq
        pkgs.wrk
        pkgs.tmux
        pkgs.tldr
        pkgs.direnv
        universal-ctags
      ];
    };

    universal-ctags = pkgs.callPackage ./pkgs/universal-ctags {};
  };
}
