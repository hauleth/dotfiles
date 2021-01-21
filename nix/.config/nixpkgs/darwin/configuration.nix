{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import ../overlays/neovim-nightly.nix)
    (import ../overlays/ctags.nix)
    (import ../overlays/encpipe.nix)
    (import ../overlays/fonts.nix)
    (import ../overlays/git-riff.nix)
  ];

  system.defaults.dock.autohide = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  environment.variables = {
    EDITOR = "nvim";
    LESS = "-SRFXi";
    ERL_FLAGS = "-kernel shell_history enabled";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    _1password
    bat
    coreutils
    direnv
    nix-direnv
    entr
    findutils
    fzy
    git-lfs
    gitAndTools.diff-so-fancy
    gitAndTools.git-imerge
    gitAndTools.git-test
    gitAndTools.git-chglog
    gitAndTools.hub
    gitAndTools.tig
    git
    git-riff
    gnupg
    httpie
    imagemagick
    jq
    lnav
    neovim-nightly
    neovim-remote
    noti
    pinentry_mac
    ripgrep
    universal-ctags
    # w3m
    #watchman
    weechat
  ];

  environment.shells = [ pkgs.fish ];

  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
    lato
    iosevka-ss09
    iosevka-ss09-term
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

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
  launchd.daemons.dnsmasq.serviceConfig.StandardErrorPath = "/var/log/dnsmasq.log";

  programs.gnupg = {
    agent.enable = false;
    agent.enableSSHSupport = true;
  };

  programs.fish = {
    enable = true;
    translateEnvironment = true;
    shellAliases = {
      git = "LC_CTYPE=UTF-8 LANG=C hub";
    };
  };
  programs.zsh = {
    enable = true;
  };

  nix.package = pkgs.nixFlakes;
  # nix.useSandbox = true;
  nix.sandboxPaths = [
    "/System/Library/Frameworks"
    "/System/Library/PrivateFrameworks"
    "/usr/lib"
    "/private/tmp"
    "/private/var/tmp"
    "/usr/bin/env"
  ];
  nix.extraOptions = ''
    gc-keep-derivations = true
    gc-keep-outputs = true

    keep-outputs = true
    keep-derivations = true

    experimental-features = nix-command flakes
    '';

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 8;
  nix.buildCores = 8;
}
