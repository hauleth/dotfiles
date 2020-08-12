self: super:

with super;

let
  libhydrogen = fetchFromGitHub {
    name = "libhydrogen";

    owner = "jedisct1";
    repo = "libhydrogen";
    # url = "https://github.com/jedisct1/libhydrogen.git";
    rev = "c879a1d572de4bb2d3bd90516f449557eb156c96";
    sha256 = "1b1bqwpws4n0y2qm9k5a55jynakq7gdqqqqbxakfrrlfwj7hjn4d";
  };
  encpipe = self.stdenv.mkDerivation rec {
    name = "encpipe-${version}";
    version = "0.5";

    nativeBuildInputs = [ git ];

    preBuild = ''
      cp -R ${libhydrogen}/* ext/libhydrogen
      buildFlagsArray+=(CFLAGS="-O3 -march=native -fno-exceptions -I. -Iext/libhydrogen")
      '';

    installFlags = [ "PREFIX=$(out)" ];

    src = fetchFromGitHub {
      owner = "jedisct1";
      repo = "encpipe";
      # url = "https://github.com/jedisct1/encpipe.git";
      rev = "9abbb95ab6c51b5fb85db7c5ea65843b4d788aae";
      sha256 = "05rv6a5zgzf1i5nn7mzi6sg47papkdfj8jpj7dnjv4hq752i3mhs";
    };
  };
in
  {
    inherit encpipe;
  }
