final: prev:

with prev;

{
  comby = stdenv.mkDerivation rec {
    pname = "comby";
    version = "1.0.0";

    nativeBuildInputs = [ autoPatchelfHook ];

    buildInputs = [ pcre ];

    src = fetchurl {
      url = "https://github.com/comby-tools/comby/releases/download/${version}/comby-${version}-x86_64-macos.tar.gz";
      sha256 = "0p9qna7sbgxfi8m0mr83nbx6jwp4jg9xrvqgwibk1wvhj1d33nvp";
    };

    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/bin
      tar xzf $src
      mv comby-$version-x86_64-macos $out/bin/comby
      '';

    postFixup = 
    let libpath = lib.makeLibraryPath [ pcre ];
    in ''
      install_name_tool -change /usr/local/opt/pcre/lib/libpcre.1.dylib ${libpath}/libpcre.1.dylib $out/bin/comby
      '';
  };
}
