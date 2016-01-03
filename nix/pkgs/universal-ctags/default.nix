{ stdenv, fetchgit, automake, autoconf, git, libtool }:

stdenv.mkDerivation {
  name = "universal-ctags";

  buildInputs = [
    automake
    autoconf
    libtool
    git
  ];

  src = fetchgit {
    url = "https://github.com/universal-ctags/ctags.git";
    rev = "72912f07d43af1c7e2cbbce245f80eaeaaf41751";
    sha256 = "1m8567l7imjf26q696rcyqfsp66j50pzi142har3w9mcjlflahjy";
    leaveDotGit = true;
  };

  preConfigure = "./autogen.sh";
  configureFlags = [
    "--enable-iconv"
  ];
}
