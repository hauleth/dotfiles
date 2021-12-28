{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import ../overlays/encpipe.nix)
    (import ../overlays/fonts.nix)
    (import ../overlays/git-riff.nix)
    (import ../overlays/comby.nix)
  ];

  system.defaults.dock.autohide = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    _1password
    age
    bat
    comby
    coreutils
    curlie
    direnv
    nix-direnv
    entr
    findutils
    fzy
    fishPlugins.agnoster
    git-lfs
    git-gone
    git-branchless
    git-revise
    gitAndTools.diff-so-fancy
    gitAndTools.git-imerge
    gitAndTools.git-test
    gitAndTools.git-chglog
    gitAndTools.hub
    gitAndTools.tig
    git
    gh
    glab
    # git-riff
    gnupg
    imagemagick
    jq
    lnav
    neovim
    neovim-remote
    noti
    pinentry_mac
    qmk
    ripgrep
    universal-ctags
    # w3m
    # watchman
    weechat
  ];

  environment.shells = [ pkgs.fish ];

  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
    lato
    iosevka-ss09
    iosevka-ss09-term
  ];

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon = {
  #   enable = true;
  # };

  services.dnsmasq = {
    enable = true;
    port = 35353;
    addresses = {
      localhost = "127.0.0.1";
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      git = "LC_CTYPE=UTF-8 LANG=C hub";
      g = "git";
      e = "$EDITOR";
    };

    shellInit = ''
      source (${pkgs.direnv}/bin/direnv hook fish | psub)

      set -gx XDG_RUNTIME_DIR (getconf DARWIN_USER_TEMP_DIR)
      set -gx MIX_XDG 1

      test -e $HOME/.iterm2_shell_integration.fish ; and source $HOME/.iterm2_shell_integration.fish

      ulimit -n 10480
      '';
  };

  # nix.useSandbox = true;
  nix.sandboxPaths = [
    "/System/Library/Frameworks"
    "/System/Library/PrivateFrameworks"
    "/usr/lib"
    "/private/tmp"
    "/private/var/tmp"
    "/usr/bin/env"
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 8;
  nix.buildCores = 8;
}
