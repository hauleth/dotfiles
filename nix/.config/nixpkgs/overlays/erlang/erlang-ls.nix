{ rebar3Relx, fetchFromGitHub, gitMinimal }:

let
  json = builtins.fromJSON (builtins.readFile ./erlang-ls.json);
in rebar3Relx rec {
  name = "erlang-ls";
  version = json.rev;
  releaseType = "escript";

  src = fetchFromGitHub json;
}
