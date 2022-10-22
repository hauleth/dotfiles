{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  nix.useDaemon = true;
  services.nix-daemon.enable = true;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.settings.max-jobs = 8;
  nix.settings.cores = 8;

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    auto-optimise-store = true

    keep-outputs = true
    # keep-derivations = true

    experimental-features = nix-command flakes
  '';

  # nix.useSandbox = true;
  nix.settings.extra-sandbox-paths = [
    "/System/Library/Frameworks"
    "/System/Library/PrivateFrameworks"
    "/usr/lib"
    "/private/tmp"
    "/private/var/tmp"
    "/usr/bin/env"
  ];
}
