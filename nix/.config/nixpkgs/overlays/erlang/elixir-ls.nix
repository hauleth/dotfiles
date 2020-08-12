{ stdenv, elixir, rebar3, hex, fetchFromGitHub, fetchMixDeps, git, cacert }:

let
  json = builtins.fromJSON (builtins.readFile ./elixir-ls.json);
in
stdenv.mkDerivation rec {
  name = "elixir-ls";
  version = json.rev;

  nativeBuildInputs = [ elixir hex git deps cacert ];

  deps = fetchMixDeps {
    name = "${name}-${version}";
    inherit src;

    sha256 = "1j7v56mfa087wi3x8kdcbqq0wsdiw284cwlccvxs1b60rypx5k55";
  };

  # refresh: nix-prefetch-git https://github.com/elixir-lsp/elixir-ls.git [--rev branchName | --rev sha]
  src = fetchFromGitHub json;

  dontStrip = true;

  configurePhase = ''
    runHook preConfigure
    export MIX_ENV=prod

    export HEX_OFFLINE=1
    export HEX_HOME="$PWD/hex"
    export MIX_HOME="$PWD"
    export MIX_REBAR3="${rebar3}/bin/rebar3"
    export REBAR_GLOBAL_CONFIG_DIR="$out/rebar3"
    export REBAR_CACHE_DIR="$out/rebar3.cache"

    cp --no-preserve=all -R ${deps} deps

    mix deps.compile --no-deps-check

    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild

    mix do compile --no-deps-check, elixir_ls.release

    runHook postBuild
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -Rv release $out/lib

    # Prepare the wrapper script
    substitute release/language_server.sh $out/bin/elixir-ls \
      --replace 'exec "''${dir}/launch.sh"' "exec $out/lib/launch.sh"
    chmod +x $out/bin/elixir-ls

    # prepare the launcher
    substituteInPlace $out/lib/launch.sh \
      --replace "ERL_LIBS=\"\$SCRIPTPATH:\$ERL_LIBS\"" \
                "ERL_LIBS=$out/lib:\$ERL_LIBS" \
      --replace "elixir -e" "${elixir}/bin/elixir -e"
  '';
}
