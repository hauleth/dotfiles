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
      configuration = { pkgs, ... }: {
        nixpkgs.overlays = [
          agnoster.overlay
          (self: super: { nix-direnv = super.nix-direnv.override { enableFlakes = true; }; } )
        ];

        environment.variables = {
          EDITOR = "nvim";
          LESS = "-SRFXi";
          ERL_FLAGS = "-kernel shell_history enabled";
        };

        launchd.user.agents.plan-sync.serviceConfig = {
          ProgramArguments = [
            "/usr/bin/curl"
            "--netrc-optional"
            "-F" "plan=&lt;/Users/hauleth/.plan"
            "https://plan.cat/stdin"
          ];

          WatchPaths = [
            "/Users/hauleth/.plan"
          ];

          StandardErrorPath = "/Users/hauleth/.local/state/launchd/logs/plan-sync.stderr";
        };

        nix.package = pkgs.nixFlakes;
        nix.extraOptions = ''
        gc-keep-derivations = true
        gc-keep-outputs = true

        keep-outputs = true
        keep-derivations = true

        experimental-features = nix-command flakes
        '';
      };
    in {
      darwinConfigurations."NiunioBook" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          configuration
          ./nix/.config/nixpkgs/darwin/configuration.nix
        ];
      };

      # for convenience
      darwinPackages = self.darwinConfigurations."NiunioBook".pkgs;
    };
  }
