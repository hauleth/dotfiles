{pkgs, ...}: let
  # Temporarily disable building as it fails on macOS due to being unable to build
  # ttfautohint
  # design = [
  #   "ss09"
  #   "calt-logic"
  #   "v-dollar-open"
  #   "v-g-singlestorey"
  #   "v-l-zshaped"
  #   "v-percent-dots"
  #   "v-y-straight"
  #   "v-zero-slashed"
  # ];
  # iosevka-ss09 = pkgs.iosevka.override {
  #   set = "ss09";
  #   privateBuildPlan = {
  #     family = "Iosevka";
  #     inherit design;
  #   };
  # };
  # iosevka-ss09-term = pkgs.iosevka.override {
  #   set = "ss09-term";
  #   privateBuildPlan = {
  #     family = "Iosevka Term";
  #     design = design ++ [ "term" ];
  #   };
  # };
  buildIosevka = {set}:
    pkgs.stdenv.mkDerivation {
      name = "iosevka-${set}";
      src = ./fonts/iosevka-${set};

      buildPhase = ''
        true
      '';

      installPhase = ''
        fontdir="$out/share/fonts/truetype"
        install -d "$fontdir"
        install ./*.ttf "$fontdir"
      '';
    };
  iosevka-ss09 = buildIosevka {set = "ss09";};
  iosevka-ss09-term = buildIosevka {set = "ss09-term";};
in {
  fonts = {
    fontDir.enable = true;
    fonts = [
      pkgs.lato
      iosevka-ss09
      iosevka-ss09-term
    ];
  };
}
