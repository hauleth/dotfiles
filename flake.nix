{
  description = "Hauleth's configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "flake:flake-utils";
    home-manager = {
      url = "flake:home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

  outputs = {
    self,
    darwin,
    nixpkgs,
    home-manager,
    agnoster,
    flake-utils,
    nix-elixir,
    ...
  } @ inputs: let
    overlays = [
      agnoster.overlay
      nix-elixir.overlay
      (import ./pkgs)
    ];
  in
    flake-utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {inherit system overlays;};
    in {
      formatter = pkgs.alejandra;

      packages = {
        home = pkgs.writeScriptBin "activate-home" ''
          ${home-manager.packages.${system}.default}/bin/home-manager --flake "${self}" "$@"
          '';

        system = let
          emptyConfiguration = darwin.lib.darwinSystem {
            inherit system;

            modules = [];
          };
          builder =
            if pkgs.stdenv.isDarwin
            then "${emptyConfiguration.system}/sw/bin/darwin-rebuild"
            else pkgs.lib.getExe pkgs.nixos-rebuid;
        in pkgs.writeScriptBin "activate-system" ''
            ${builder} --flake "${self}#''$(hostname -s)" "$@"
          '';
      };

      devShells =
        (pkgs.callPackage ./dev_shells.nix {})
        // {
          default = pkgs.mkShell {
            packages = [
              pkgs.fnlfmt
              # TODO: Remove it and manage all configuration from Nix
              pkgs.stow
            ];
          };
        };
    })
    // {
      lib = {
        readFileWithComments = path: let
          lib = nixpkgs.lib;
          content = lib.strings.fileContents path;
          notComment = line: !lib.strings.hasPrefix "#" line;
        in
          builtins.filter notComment (lib.strings.splitString "\n" content);
      };

      # TODO: Automatically discover and build that
      darwinConfigurations."NiunioBook" =
        (import ./hosts/niuniobook.nix {
          inherit inputs overlays;
        })
        .system;

      homeConfigurations."hauleth" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-darwin";
          inherit overlays;
        };

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          {
            home.username = "hauleth";
            home.homeDirectory = "/Users/hauleth/";
          }
          ./modules/fish.nix
          ./modules/direnv.nix
          ./modules/git.nix
          ./modules/plan.nix
          ./modules/ctags.nix
          ./modules/curl.nix
          { home.stateVersion = "22.11"; }
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
