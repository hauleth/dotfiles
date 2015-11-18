{
  packageOverrides = pkgs:
  rec {
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
        pkgs.go
        pkgs.scala
        pkgs.sbt
        pkgs.julia
        pkgs.elixir
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
  };
}
