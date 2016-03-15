{ stdenv, fetchgit, automake, autoconf, ncurses, pkgconfig, libevent }:

stdenv.mkDerivation {
  name = "tmux-2.2-e9d369a0";

  buildInputs = [
    automake
    autoconf
    pkgconfig
    ncurses
    libevent
  ];

  src = fetchgit {
    url = "https://github.com/tmux/tmux.git";
    rev = "e9d369a0";
    sha256 = "7ae3811591a7ce45e4c85163dbd3c0925acd1fbd21d9eed714cfb6a290c71869";
  };

  preConfigure = "./autogen.sh";
  configureFlags = [
    "--with-truecolor"
  ];
}

