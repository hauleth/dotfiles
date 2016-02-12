{ stdenv, fetchzip, automake, autoconf, ncurses, libtool }:

stdenv.mkDerivation {
  name = "htop-2.0.0";

  buildInputs = [
    automake
    autoconf
    libtool
    ncurses
  ];

  src = fetchzip {
    url = "https://github.com/hishamhm/htop/archive/2.0.0.zip";
    sha256 = "1z8rzf3ndswk3090qypl0bqzq9f32w0ik2k5x4zd7jg4hkx66k7z";
  };

  preConfigure = "./autogen.sh";
  configureFlags = [
    "--enable-unicode"
    "--enable-native-affinity"
  ];
}
