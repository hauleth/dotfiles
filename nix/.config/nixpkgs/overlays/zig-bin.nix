final: prev:

{
  zig-bin = prev.stdenv.mkDerivation rec {
    pname = "zig";
    version = "0.7.1";

    src = prev.fetchurl {
      url = "https://ziglang.org/download/0.7.1/zig-macos-x86_64-${version}.tar.xz";
      sha256 = "06f57cg121civy397b8yy3m2a19k6d73z6g3cz7z12lpc9sv2p44";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/bin
      ls -la
      mv zig $out/bin/zig
      mv lib $out/lib
      '';
  };
}
