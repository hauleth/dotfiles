{ stdenv, erlang, fetchFromGitHub, fetchMixDeps, git }:

with erlang;

stdenv.mkDerivation rec {
  name = "elixir-ls";
  version = "unstable-2019-07-15";

  nativeBuildInputs = [ elixir hex git ];

  deps = fetchMixDeps {
    inherit name version src;
  };

  # refresh: nix-prefetch-git https://github.com/elixir-lsp/elixir-ls.git [--rev branchName | --rev sha]
  src = fetchFromGitHub {
    rev = "95c021fdb8e279ae3e9ab0ae1af8624d5572fad3";
    owner = "elixir-lsp";
    repo = "elixir-ls";
    sha256 = "0qkqra09rvw6hxa8pbdvxnvqlvgw0qyq2rlgd56hxjbxa280ba1c";
  };

  dontStrip = true;

  configurePhase = ''
    runHook preConfigure
    export HEX_OFFLINE=1
    export MIX_HOME=`pwd`

    cp --no-preserve=all -R ${deps}/deps deps
    mix local.rebar rebar3 ${rebar3}/bin/rebar3
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    export MIX_ENV=prod

    mix elixir_ls.release

    runHook postBuild
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -Rv release $out/lib
    substitute release/language_server.sh $out/bin/language_server.sh \
    --replace "ERL_LIBS=\"\$SCRIPTPATH:\$ERL_LIBS\"" "ERL_LIBS=$out/lib:\$ERL_LIBS" \
    --replace "elixir -e" "${elixir}/bin/elixir -e"
    chmod +x $out/bin/language_server.sh
    mv $out/bin/language_server.sh $out/bin/elixir-ls
  '';
}
