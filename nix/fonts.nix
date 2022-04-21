{pkgs, ...}: {
  nixpkgs.overlays = [
    (import ./overlays/fonts)
  ];

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    lato
    iosevka-ss09
    iosevka-ss09-term
  ];
}
