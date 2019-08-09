self: super:

with self;

let
  fetchMixDeps = callPackage ./erlang/fetch-mix-deps.nix {};
in
{
  inherit fetchMixDeps;

  erlangSourcer = callPackage ./erlang/sourcer.nix {
    erlang = beam.packages.erlang;
  };

  elixirLS = self.callPackage ./erlang/elixir-ls.nix {
    erlang = beam.packages.erlang;
  };
}
