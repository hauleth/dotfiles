{
  description = "Hauleth's configuration";

  inputs = {
    nixpkgs.url = "flake:nixpkgs";
    flake-utils.url = "flake:flake-utils";
    agnoster = {
      url = "github:hauleth/agnoster";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    darwin,
    nixpkgs,
    agnoster,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      formatter = pkgs.alejandra;

      devShells.default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.fnlfmt
          pkgs.alejandra
          # TODO: Remove it and manage all configuration from Nix
          pkgs.stow
        ];
      };

      devShells.erlang = let
        erlang = pkgs.beam.packages.erlangR25;
      in
        pkgs.mkShell {
          nativeBuildInputs = [
            erlang.erlang
            erlang.rebar3
            erlang.erlang-ls
          ];
        };

      devShells.elixir = let
        erlang = pkgs.beam.packages.erlangR25;
      in
        pkgs.mkShell {
          nativeBuildInputs = [
            erlang.elixir
            erlang.elixir_ls
          ];
        };

      devShells.rust = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.cargo
          pkgs.rustc
          pkgs.rust-analyzer
        ];
      };
    })
    // {
      darwinConfigurations."NiunioBook" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./nix/nix.nix
          ./nix/system.nix
          ./nix/services.nix
          ./nix/fonts.nix
          ./nix/environment.nix
          {system.stateVersion = 4;}
          {documentation.enable = false;}
        ];
        inputs = {
          flake = self;
          inherit agnoster;
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
