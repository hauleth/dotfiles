{
  description = "Hauleth's configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "flake:flake-utils";
    agnoster = {
      url = "github:hauleth/agnoster";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    nix-elixir.url = "github:hauleth/nix-elixir";
    # nix-elixir.url = "flake:nix-elixir";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , darwin
    , nixpkgs
    , agnoster
    , flake-utils
    , nix-elixir
    }:
    let
      overlays = [
        agnoster.overlay
        nix-elixir.overlay
        (import ./pkgs)
      ];
    in
    flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = import nixpkgs { inherit system overlays; };
      in
      {
        formatter = pkgs.alejandra;

        legacyPackages = pkgs;

        devShells = (pkgs.callPackage ./dev_shells.nix { }) // {
          _sefault = pkgs.mkShell {
            nativeBuildInputs = [
              pkgs.fnlfmt
              pkgs.alejandra
              # TODO: Remove it and manage all configuration from Nix
              pkgs.stow
            ];
          };
        };
      })
    // {
      darwinConfigurations."NiunioBook" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          { nixpkgs = { inherit overlays; }; }
          ./nix/nix.nix
          ./nix/system.nix
          ./nix/services.nix
          ./nix/fonts.nix
          ./nix/environment.nix
          ./nix/security.nix
          ./modules/nvim.nix
          {
            system.stateVersion = 4;
            documentation.enable = true;
          }
        ];

        specialArgs = {
          inherit darwin nixpkgs;

          dotfiles = self;
        };
      };

      # for convenience
      darwinPackages = self.darwinConfigurations."NiunioBook".pkgs;

      templates = {
        elixir = {
          path = ./templates/elixir;
          description = "Basic requirements for Elixir applications";
        };
      };
    };
}
