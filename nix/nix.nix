{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 8;
  nix.buildCores = 8;

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    gc-keep-derivations = true
    gc-keep-outputs = true

    keep-outputs = true
    keep-derivations = true

    experimental-features = nix-command flakes
    '';

  # nix.useSandbox = true;
  nix.sandboxPaths = [
    "/System/Library/Frameworks"
    "/System/Library/PrivateFrameworks"
    "/usr/lib"
    "/private/tmp"
    "/private/var/tmp"
    "/usr/bin/env"
  ];
}
