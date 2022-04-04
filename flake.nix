{
  description = "Hauleth's configuration";

  inputs = {
    nixpkgs.url = "flake:nixpkgs";
    agnoster = {
      url = "github:hauleth/agnoster";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, darwin, nixpkgs, agnoster }:
    let
      overlays = { pkgs, ... }: {
        nixpkgs.overlays = [
          agnoster.overlay
        ];
      };
      version = { ... }: { system.stateVersion = 4; };
    in {
      darwinConfigurations."NiunioBook" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          overlays
          ./nix/nix.nix
          ./nix/system.nix
          ./nix/services.nix
          ./nix/fonts.nix
          ./nix/environment.nix
          version
        ];
        inputs = { inherit self; };
      };

      # for convenience
      darwinPackages = self.darwinConfigurations."NiunioBook".pkgs;
    };
  }
