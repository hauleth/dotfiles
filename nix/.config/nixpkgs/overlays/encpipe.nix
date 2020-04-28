self: super:

with super;

let
  libhydrogen = fetchGit {
    name = "libhydrogen";

    url = "https://github.com/jedisct1/libhydrogen.git";
    ref = "master";
  };
in
{
  encpipe = self.stdenv.mkDerivation rec {
    name = "encpipe-${version}";
    version = "0.5";

    nativeBuildInputs = [ git ];

    preBuild = ''
      cp -R ${libhydrogen}/* ext/libhydrogen
      '';

    installFlags = [ "PREFIX=$(out)" ];

    src = fetchGit {
      url = "https://github.com/jedisct1/encpipe.git";
      ref = "master";
    };
  };
}
