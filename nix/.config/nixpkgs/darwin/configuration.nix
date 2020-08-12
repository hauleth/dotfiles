{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import ../overlays/encpipe.nix)
    (import ../overlays/fonts.nix)
    (import ../overlays/ctags.nix)
  ];

  system.defaults.dock.autohide = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    asciinema
    bat
    coreutils
    direnv
    entr
    findutils
    fzy
    git-lfs
    gitAndTools.diff-so-fancy
    gitAndTools.git-imerge
    gitAndTools.git-test
    gitAndTools.hub
    gitAndTools.tig
    gitFull
    gnupg
    httpie
    imagemagick
    jq
    lnav
    neovim
    neovim-remote
    noti
    pinentry_mac
    ripgrep
    universal-ctags
    w3m
    watchman
    weechat
  ];

  environment.shells = [ pkgs.fish ];

  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
    lato
    iosevka
    iosevkaTerm
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon = {
    enable = true;
    enableSocketListener = true;
  };

  services.dnsmasq = {
    enable = true;
    addresses = {
      localhost = "127.0.0.1";
    };
  };

  launchd.user.agents.watchman = {
    serviceConfig.ProgramArguments = ["${pkgs.watchman}/bin/watchman" "--foreground"];
    serviceConfig.KeepAlive = true;
    serviceConfig.RunAtLoad = true;
  };

  programs.gnupg = {
    agent.enable = false;
    agent.enableSSHSupport = true;
  };

  programs.fish = {
    enable = true;
  };

  nix.package = pkgs.nixStable;
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
    '';

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 12;
  nix.buildCores = 12;
}
