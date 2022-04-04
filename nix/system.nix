{ config, pkgs, ... }:

{
  system = {
    defaults.dock.autohide = true;

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
