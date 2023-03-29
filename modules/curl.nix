{ pkgs, ... }: {
  home.packages = [
    pkgs.curl
    pkgs.curlie
  ];

  home.file.curlrc = {
    target = ".curlrc";

    text = ''
      silent=true

      netrc-optional
    '';
  };
}
