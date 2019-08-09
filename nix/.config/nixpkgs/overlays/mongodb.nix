self: super:

with self;

{
  mongodb-4_0 = stdenv.mkDerivation rec {
    name = "mongodb-${version}";
    version = "4.0.11";

    src = fetchurl {
      url = "https://fastdl.mongodb.org/osx/mongodb-osx-ssl-x86_64-${version}.tgz";
      sha256 = "156ci2zl3dwwfc0pzqkk88ivvz0wwqb7h86zgmk4wxmjr4smzmig";
    };

    phases = [ "unpackPhase" "installPhase" ];

    installPhase = ''
        mkdir -p "$out"
        ls -la
        mv bin "$out/bin"
    '';
  };
}
