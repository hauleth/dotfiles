{ stdenv, elixir, rebar3, git, cacert }:

{ name, version, sha256 ? null, src, env ? "prod" }:

with stdenv;

mkDerivation {
  name = "mix-deps-${name}-${version}";

  nativeBuildInputs = [ elixir git cacert ];

  phases = [ "downloadPhase" "installPhase" ];

  downloadPhase = ''
    export HEX_HOME=$PWD
    export MIX_HOME=$PWD
    export MIX_ENV=${env}

    echo $HEX_HOME

    cp -R ${src}/* .

    mix local.hex --force
    mix local.rebar rebar3 ${rebar3}/bin/rebar3
    mix deps.get

    ls -la deps
    '';

  installPhase = ''
    mkdir -p "$out"
    cp -R deps "$out"
    '';

  outputHashAlgo = "sha256";
  outputHashMode = "recursive";
  # outputHash = sha256;

  impureEnvVars = lib.fetchers.proxyImpureEnvVars;
}
