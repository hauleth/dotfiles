{ config, pkgs, ... }:

{
  system.defaults.dock.autohide = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;
    [ neovim
      neovim-remote
      universal-ctags
      ripgrep
      fzy
      jq
      direnv
      git
      gitAndTools.hub
      gitAndTools.git-imerge
      gitAndTools.git-test
      gitAndTools.tig
      gnupg
      keychain
      noti
      entr
      httpie
      dnsmasq
    ];

  environment.shells = [ pkgs.fish ];

  fonts.enableFontDir = true;
  fonts.fonts = let
    iosevkaTerm = pkgs.iosevka.override {
      set = "term";
      family = "Iosevka Term";
      design = [ "ss10" "term" ];
    };
    iosevka = pkgs.iosevka.override {
      set = "ss10";
      family = null;
      design = [ "ss10" "calt-logic" ];
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
  services.nix-daemon.enable = true;
  services.nix-daemon.enableSocketListener = true;

  # Set .localhost. TLD on loopback address
  launchd.daemons.dnsmasq = {
    command = "${pkgs.dnsmasq}/bin/dnsmasq -a 127.0.0.1 --keep-in-foreground";
    serviceConfig.KeepAlive = true;
    serviceConfig.RunAtLoad = true;
  };
  environment.etc."dnsmasq.conf" = {
    enable = true;
    text = ''
      address=/localhost/127.0.0.1
      '';
  };
  environment.etc."resolver/localhost" = {
    enable = true;
    text = "nameserver 127.0.0.1";
  };

  nix.package = pkgs.nixStable;
  # nix.useSandbox = true;
  # nix.sandboxPaths = [ "/System/Library/Frameworks" "/System/Library/PrivateFrameworks" "/usr/lib" "/private/tmp" "/private/var/tmp" "/usr/bin/env" ];

  nixpkgs.config.allowUnfree = true;

  programs.gnupg.agent.enable = false;
  programs.gnupg.agent.enableSSHSupport = true;

  # programs.nix-index.enable = true;

  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 3;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 12;
  nix.buildCores = 12;
}
