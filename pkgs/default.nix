final: prev: {
  beam =
    prev.beam
    // {
      defaultVersion = "erlangR25";

      packages =
        prev.beam.packages
        // {
          erlangR25 = prev.beam.packages.erlangR25.extend (efinal: eprev: {
            elixir = eprev.elixir_1_14;
            rebar3 = eprev.rebar3.overrideAttrs (_: { doCheck = false; });
          });
        };

      packagesWith = erlang:
        (prev.beam.packagesWith erlang).extend (efinal: eprev: {
          livebook = eprev.livebook.override { elixir = efinal.elixir_1_14; };
        });
    };

  livebook = final.beam.packages.livebook;

  fswatch = prev.writeShellApplication {
    name = "fswatch";

    runtimeInputs = [ final.entr final.ripgrep ];

    text = ''
      rg -l -t "$1" "" | entr -p echo /_
    '';
  };
}
