{
  packageOverrides = pkgs: rec {
    runtime = pkgs.buildEnv {
      name = "runtime";
      paths = [
        pkgs.python27Full
        pkgs.python27Packages.pip
      ];
    };

    languages = pkgs.buildEnv {
      name = "languages";
      paths = [
        pkgs.elixir
        pkgs.ghc
        pkgs.go
        pkgs.julia
        pkgs.ocaml
        pkgs.sbt
        pkgs.scala
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
      ];
    };

    universal-ctags = pkgs.callPackage ./pkgs/universal-ctags {};
  };
}
