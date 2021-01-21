self: super:

# @real fox.quick(h){ *is_brown && it_jumps_over(dogs.lazy) }
# 0123456789 ABC.DEF.GHI.JKL.MNO.PQRS.TUV.WXYZ ß <=`¶^$#%'

let
  design = [
    "ss09"
    "calt-logic"
    "v-dollar-open"
    "v-g-singlestorey"
    "v-l-zshaped"
    "v-percent-dots"
    "v-y-straight"
    "v-zero-slashed"
  ];
  iosevka-ss09 = super.iosevka.override {
    set = "ss09";
    privateBuildPlan = {
      family = "Iosevka";
      inherit design;
    };
  };
  iosevka-ss09-term = super.iosevka.override {
    set = "ss09-term";
    privateBuildPlan = {
      family = "Iosevka Term";
      design = design ++ [ "term" ];
    };
  };
in {
  inherit iosevka-ss09 iosevka-ss09-term;
}
