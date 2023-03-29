{
  mkShell,
  beam,
  pkgs,
  lib,
  stdenv,
  darwin,
}: {
  livebook = pkgs.mkShell {
    packages = with beam.packages.erlang; [
      livebook
    ];

    LIVEBOOK_TOKEN_ENABLED = "false";
  };

  erlang = with beam.packages.erlang;
    mkShell {
      packages = [
        erlang
        rebar3
        erlang-ls
      ];
    };

  elixir = with beam.packages.erlang;
    mkShell {
      packages =
        [
          elixir
          elixir-ls
        ]
        ++ lib.optionals stdenv.isDarwin [
          darwin.apple_sdk.frameworks.CoreFoundation
          darwin.apple_sdk.frameworks.CoreServices
        ];
    };

  rust = mkShell {
    packages = [
      pkgs.cargo
      pkgs.rustc
      pkgs.rust-analyzer
    ];
  };
}
