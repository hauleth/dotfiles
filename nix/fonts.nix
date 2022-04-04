{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ./overlays/fonts)
  ];

  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
    lato
    iosevka-ss09
    iosevka-ss09-term
  ];
}
