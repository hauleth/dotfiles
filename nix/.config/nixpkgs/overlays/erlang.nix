self: super:

let
  fetchMixDeps = super.callPackage ./erlang/fetch-mix-deps.nix {};
  packages = super.beam.packages.erlang;
in
{
  inherit fetchMixDeps;

  erlangSourcer = packages.callPackage ./erlang/sourcer.nix {};
  erlangLS = packages.callPackage ./erlang/erlang-ls.nix {};
  elixirLS = packages.callPackage ./erlang/elixir-ls.nix {};
}
