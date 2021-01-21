self: super:

with super;

let
  git-riff = self.stdenv.mkDerivation rec {
    name = "git-riff";
    version = "1.0";

    src = fetchFromGitHub {
      owner = "hauleth";
      repo = "git-riff";
      rev = "ab17fec9cca47cc3c89575e74257a51dec005711";
      sha256 = "1g86z701yxn9whvkhpaqvmxim4hhhy4qrkjxi7fgzhjzmsamzkxw";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/bin
      mv git-riff $out/bin/git-riff
      chmod +x $out/bin/git-riff
      '';
  };
in {
  inherit git-riff;
}
