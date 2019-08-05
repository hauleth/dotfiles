{ erlang, fetchFromGitHub, gitMinimal }:

let
  json = builtins.fromJSON (builtins.readFile ./sourcer.json);
in erlang.rebar3Relx rec {
  name = "erlang-ls";
  version = "unstable-2019-07-26";
  releaseType = "escript";

  nativeBuildInputs = [ gitMinimal ];

  src = fetchFromGitHub json;
}
