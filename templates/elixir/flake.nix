{
  description = "Elixir's application";

  inputs.nixpkgs.url = "flake:nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      erl = pkgs.beam.packages.erlangR24;
    in {
      # TODO: Add default package and overlay there

      devShell = pkgs.mkShell {
        nativeBuildInputs = [
          erl.elixir
          erl.elixir_ls
        ] ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
          pkgs.darwin.apple_sdk.frameworks.CoreFoundation
          pkgs.darwin.apple_sdk.frameworks.CoreServices
        ];
      };
    }
  );
}
