{pkgs, ...}: let
  variants = {
    design = {
      i = "hooky";
      l = "zshaped";
      g = "single-storey-serifless";
      y = "straight";
      zero = "slashed";
      dollar = "open";
      percent = "dots";
      four = "semi-open-non-crossing";
      lig-ltgteq = "slanted";
    };
  };
  weights = {
    extralight = {
      shape = 200;
      menu = 200;
      css = 200;
    };
    regular = {
      shape = 400;
      menu = 400;
      css = 400;
    };
    bold = {
      shape = 700;
      menu = 700;
      css = 700;
    };
  };
  slopes = {
    upright = {
      angle = 0;
      shape = "upright";
      menu = "upright";
      css = "normal";
    };

    italic = {
      angle = 9.4;
      shape = "italic";
      menu = "italic";
      css = "italic";
    };
  };
  buildIosevka = pkgs.iosevka.override;
  iosevka-ss09 = buildIosevka {
    set = "ss09";
    privateBuildPlan = {
      family = "Iosevka";

      inherit variants weights slopes;
    };
  };
  iosevka-ss09-term = buildIosevka {
    set = "ss09-term";
    privateBuildPlan = {
      family = "Iosevka Term";
      spacing = "term";

      inherit variants weights slopes;
    };
  };
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
