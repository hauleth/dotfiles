self: super:

let
  universal-ctags = (super.universal-ctags.overrideAttrs(oldAttrs: {
    version = "unstable-2020-08-07";

    doCheck = false;

    src = super.fetchFromGitHub {
      owner = "universal-ctags";
      repo = "ctags";
      rev = "f2245092348e38f02cbfa5ede44bcbc37a336501";
      sha256 = "05ypqvx5xizygba93gv8ab9crv3kklghy7bq5g8ck23p6l985ch3";
    };
  })).override {
    pythonPackages = super.python3.pkgs;
  };
in
  {
    inherit universal-ctags;
  }
