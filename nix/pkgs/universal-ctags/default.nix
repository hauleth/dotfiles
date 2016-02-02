{ stdenv, fetchzip, automake, autoconf, pkgconfig, libtool }:

stdenv.mkDerivation {
  name = "universal-ctags";

  buildInputs = [
    automake
    autoconf
    libtool
    pkgconfig
  ];

  src = fetchzip {
    url = "https://github.com/universal-ctags/ctags/archive/96c6e051ce6e5073a92e2b48d4d9b00be725d436.zip";
    sha256 = "0nwqc9k62gbhpkmh8gvmdzwg06gl9qviflgij0nrhpnha3wac1x1";
  };

  preConfigure = "./autogen.sh";
  configureFlags = [
    "--enable-iconv"
  ];
}
