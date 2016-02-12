{ stdenv, fetchzip, automake, autoconf, pkgconfig, libtool }:

stdenv.mkDerivation {
  name = "universal-ctags-2016.02.12-f2fef59ce643b4a2c47d356225a5a5e7213b67d6";

  buildInputs = [
    automake
    autoconf
    libtool
    pkgconfig
  ];

  src = fetchzip {
    url = "https://github.com/universal-ctags/ctags/archive/f2fef59ce643b4a2c47d356225a5a5e7213b67d6.zip";
    sha256 = "1sa465mlbky91dk6vxwww38lhppd9f5s8hsvxn2pr5viz0755zd9";
  };

  preConfigure = "./autogen.sh";
  configureFlags = [
    "--enable-iconv"
  ];
}
