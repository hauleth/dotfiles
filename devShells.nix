{ mkShell, beam } @ pkgs: {
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
    pkgs.mkShell {
      packages = [
        elixir
        elixir_ls
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
