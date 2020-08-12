self: super:

let
    iosevka = super.iosevka.override {
      set = "ss10";
      privateBuildPlan = {
        family = "Iosevka";
        design = [ "ss10" "cv10" "cv38" "cv62" "calt-logic" ];
      };
    };
    iosevkaTerm = super.iosevka.override {
      set = "term";
      privateBuildPlan = {
        family = "Iosevka Term";
        design = [ "ss10" "cv10" "cv38" "cv62" "term" ];
      };
    };
in {
  inherit iosevka iosevkaTerm;
}
