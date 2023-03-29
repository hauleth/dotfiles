{ inputs
, overlays
, ...
}: {
  type = "darwin";

  hostname = "NiunioBook";

  system = inputs.darwin.lib.darwinSystem {
    system = "x86_64-darwin";
    modules = [
      { nixpkgs = { inherit overlays; }; }
      {
        # You should generally set this to the total number of logical cores in your system.
        # $ sysctl -n hw.ncpu
        nix.settings.max-jobs = 8;
        nix.settings.cores = 8;
      }
      ../modules/common.nix
      ../modules/darwin.nix
      ../modules/iosevka.nix
      ../nix/environment.nix
      ../modules/nvim.nix
      {
        system.stateVersion = 4;
        documentation.enable = true;
      }
    ];

    inputs = {
      dotfiles = inputs.self;
    };
  };
}
