{ pkgs, ... }:
{
  nix.settings.extra-sandbox-paths = [
    "/System/Library/Frameworks"
    "/System/Library/PrivateFrameworks"
    "/usr/lib"
    "/private/tmp"
    "/private/var/tmp"
    "/usr/bin/env"
  ];

  nix.settings.allowed-users = ["@admin" "@builder" "hauleth"];

  # Simulate the systemd-resolved .localhost resolution
  services.dnsmasq = {
    enable = true;
    port = 35353;
    addresses = {
      localhost = "127.0.0.1";
    };
  };

  # Enable TouchID PAM on macOS
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    defaults.dock.autohide = true;

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
