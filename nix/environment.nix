{ config
, pkgs
, inputs
, ...
}: {
  nixpkgs.overlays =
    let
      flaked-nix-direnv = final: prev: {
        nix-direnv = prev.nix-direnv.override { enableFlakes = true; };
      };
    in
    [
      inputs.agnoster.overlay
      flaked-nix-direnv
    ];

  documentation.enable = false;

  # List packages installed in system profile. To search by name, run:
  # $ nix search nixpkgs wget
  environment.systemPackages = with pkgs; let
    fswatch = pkgs.writeShellApplication {
      name = "fswatch";

      runtimeInputs = [ pkgs.entr pkgs.ripgrep ];

      text = ''
        rg -l -t "$1" "" | entr -p echo /_
      '';
    };
    nvim = neovim.override {
      configure = {
        customRC = ''
          lua require('basic')
        '';
        packages.vimPackages = with pkgs.vimPlugins; {
          start = [
            packer-nvim
            (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
          ];

          opt = [ ];
        };
      };
    };
  in
  [
    _1password
    age
    alejandra
    asciinema
    bat
    comby
    coreutils
    curlie
    difftastic
    direnv
    entr
    findutils
    fishPlugins.agnoster
    fswatch
    fzy
    git-gone
    git-lfs
    git-revise
    gitAndTools.diff-so-fancy
    gitAndTools.git-imerge
    gitAndTools.git-test
    nix-direnv
    gitAndTools.git-chglog
    gitAndTools.tig
    git
    gh
    glab
    # git-riff
    gnupg
    imagemagick
    jq
    lnav
    lima
    nvim
    neovim-remote
    noti
    pinentry_mac
    # qmk
    ripgrep
    rnix-lsp
    universal-ctags
    # w3m
    # watchman
    weechat

  ];

  environment.shells = [ pkgs.fish pkgs.zsh ];

  environment.variables = {
    EDITOR = "nvim";
    LESS = "-SRFXi";
    ERL_FLAGS = "-kernel shell_history enabled";
  };

  programs.zsh.enable = true;
  programs.fish = {
    enable = true;

    shellAliases = {
      git = "LC_CTYPE=UTF-8 LANG=C command git";
      g = "git";
    };

    loginShellInit = "fish_add_path --move --prepend --path $HOME/.nix-profile/bin /run/wrappers/bin /etc/profiles/per-user/$USER/bin /nix/var/nix/profiles/default/bin /run/current-system/sw/bin";

    shellInit = ''
      set -gx XDG_RUNTIME_DIR (getconf DARWIN_USER_TEMP_DIR)
      set -gx MIX_XDG 1

      function e --wraps nvim --description 'Run $EDITOR'
        eval $EDITOR $argv
      end

      ulimit -n 10480
    '';

    interactiveShellInit = ''
      # use fish in nix run and nix-shell
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

      source (${pkgs.direnv}/bin/direnv hook fish | psub)
      source (${pkgs.lima}/bin/limactl completion fish | psub)

      test -e $HOME/.iterm2_shell_integration.fish ; and source $HOME/.iterm2_shell_integration.fish
    '';
  };
}
