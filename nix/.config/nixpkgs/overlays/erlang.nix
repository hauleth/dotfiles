self: super:

{
  fetchMixDeps = self.callPackage ./erlang/fetch-mix-deps.nix {};

  erlangSourcer = self.callPackage ./erlang/sourcer.nix {
    erlang = self.beam.packages.erlang;
  };

  elixirLS = self.callPackage ./erlang/elixir-ls.nix {
    erlang = self.beam.packages.erlang;
  };
}
