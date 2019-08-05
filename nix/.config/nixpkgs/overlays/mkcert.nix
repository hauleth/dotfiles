self: super:

{
  mkcert = self.buildGoPackage rec {
    name = "mkcert-${version}";
    version = "1.3.0";

    goPackagePath = "github.com/FiloSottile/mkcert";

    src = self.fetchFromGitHub {
      owner = "FiloSottile";
      repo = "mkcert";
      rev = "99e15e29f975e5fa7c897e04015aeba30b692749";
      sha256 = "1aadnsx5pfmryf8mgxg9g0i083dm1pmrc6v4ln2mm3n89wwqc9b7";
    };
  };
}
