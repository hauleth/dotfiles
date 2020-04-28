{ config, pkgs, ... }:

{
  imports = [
    ./services/dnsmasq.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import ../overlays/encpipe.nix)
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
    dnsmasq
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
    weechat
  ];

  environment.shells = [ pkgs.fish ];

  fonts.enableFontDir = true;
  fonts.fonts = let
    iosevkaTerm = pkgs.iosevka.override {
      set = "term";
      privateBuildPlan = {
        family = "Iosevka Term";
        design = [ "ss10" "cv10" "cv38" "cv62" "term" ];
      };
    };
    iosevka = pkgs.iosevka.override {
      set = "ss10";
      privateBuildPlan = {
        family = "Iosevka";
        design = [ "ss10" "cv10" "cv38" "cv62" "calt-logic" ];
      };
    };
  in [
    pkgs.lato
    iosevka
    iosevkaTerm
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon = {
    enable = false;
    enableSocketListener = true;
  };

  services.dnsmasq = {
    enable = true;
    addresses = {
      localhost = "127.0.0.1";
    };
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

  programs.gnupg = {
    agent.enable = false;
    agent.enableSSHSupport = true;
  };

  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 12;
  nix.buildCores = 12;
}
