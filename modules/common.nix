{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.useDaemon = true;
  services.nix-daemon.enable = true;

  environment.systemPackages = [
    pkgs.cachix
  ];

  nix.registry = {
    nixpkgs.flake = inputs.nixpkgs;
    dotfiles.flake = inputs.dotfiles;
  } // pkgs.lib.optionals pkgs.stdenv.isDarwin {
    darwin.flake = inputs.darwin;
  };

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true

    experimental-features = nix-command flakes
  '';
}
