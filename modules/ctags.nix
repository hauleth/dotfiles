{ config, lib, pkgs, ... }:
let
  toArg = k: v: "--${k}=${v}";
  listToArgs = k: vs: map (toArg k) vs;
  attrsetToArgs = attr: lib.strings.concatStringsSep "\n" (lib.lists.flatten (lib.attrsets.mapAttrsToList listToArgs attr));
in
{
  options.programs.ctags = {
    enable = lib.mkEnableOption "ctags";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.universal-ctags;
      defaultText = lib.literalExpression "pkgs.universal-ctags";
      description = "The <literal>ctags</literal> package to use.";
    };

    flags = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
    };
  };

  config = {
    programs.ctags = {
      enable = true;

      flags = {
        fields = [
          "+l"
          "+n"
          "+z"
          "+Z"
        ];

        exclude = [
          "_build"
          "deps"
          ".elixir_ls"
          "mix.lock"

          ".pijul"
          "log"
          "tmp"
          ".direnv"

          ".projections.json"
          "coveralls.json"

          "node_modules"
          "project.json"
          "package-lock.json"
          "yarn.lock"

          "target"
          "Cargo.lock"

          "flake.lock"
        ];
      };
    };

    home.packages = [ config.programs.ctags.package ];

    xdg.configFile.ctags = {
      target = "ctags/config.ctags";

      text = attrsetToArgs config.programs.ctags.flags;
    };
  };
}
