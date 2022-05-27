{
  description = "Hauleth's configuration";

  inputs = {
    nixpkgs.url = "flake:nixpkgs";
    agnoster = {
      url = "github:hauleth/agnoster";
      inputs.nixpkgs.follows = "nixpkgs";
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
  }: {
    darwinConfigurations."NiunioBook" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [
        ./nix/nix.nix
        ./nix/system.nix
        ./nix/services.nix
        ./nix/fonts.nix
        ./nix/environment.nix
        {system.stateVersion = 4;}
      ];
      inputs = {inherit self agnoster;};
    };

    # for convenience
    darwinPackages = self.darwinConfigurations."NiunioBook".pkgs;

    devShells."x86_64-darwin".default = let
      pkgs = nixpkgs.legacyPackages."x86_64-darwin";
    in pkgs.mkShell {
      nativeBuildInputs = [
        pkgs.alejandra
        # TODO: Remove it and manage all configuration from Nix
        pkgs.stow
      ];
    };

    devShells."x86_64-darwin".erlang = let
      pkgs = nixpkgs.legacyPackages."x86_64-darwin";
      erlang = pkgs.beam.packages.erlangR24;
    in pkgs.mkShell {
      nativeBuildInputs = [
        erlang.erlang
        erlang.erlang-ls
        erlang.rebar3
      ];
    };

    devShells."x86_64-darwin".elixir = let
      pkgs = nixpkgs.legacyPackages."x86_64-darwin";
      erlang = pkgs.beam.packages.erlangR24;
    in pkgs.mkShell {
      nativeBuildInputs = [
        erlang.elixir
        erlang.elixir_ls
      ];
    };

    devShells."x86_64-darwin".rust = let
      pkgs = nixpkgs.legacyPackages."x86_64-darwin";
    in pkgs.mkShell {
      nativeBuildInputs = [
        pkgs.cargo
        pkgs.rustc
        pkgs.rust-analyzer
      ];
    };

    templates = {
      elixir = {
        path = ./templates/elixir;
        description = "Basic requirements for Elixir applications";
      };
    };
  };
}
