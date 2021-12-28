final: prev:

{
  zig-bin = prev.stdenv.mkDerivation rec {
    pname = "zig";
    version = "0.8.0";

    src = prev.fetchurl {
      url = "https://ziglang.org/download/${version}/zig-macos-x86_64-${version}.tar.xz";
      sha256 = "1gkgpii5p67xk1gfajqvkdlnwqih1lylvp4m0czi08ybnmh977r7";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/bin
      mv zig $out/bin/zig
      mv lib $out/lib
      '';
  };
}
