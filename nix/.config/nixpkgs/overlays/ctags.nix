self: super:

let
  universal-ctags = (super.universal-ctags.overrideAttrs(oldAttrs: {
    version = "unstable-2020-08-07";

    src = super.fetchFromGitHub {
      owner = "universal-ctags";
      repo = "ctags";
      rev = "3f0ea94c60552fc4983472f6e40e375357093364";
      sha256 = "1i7r531zinvdicyhvxl0xknlxylh0m9c232x4plw4syy07rq3aac";
    };
  })).override {
    pythonPackages = super.python3.pkgs;
  };
in
  {
    inherit universal-ctags;
  }
