{
  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon = {
  #   enable = true;
  # };

  services.dnsmasq = {
    enable = true;
    port = 35353;
    addresses = {
      localhost = "127.0.0.1";
    };
  };

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Automatically watch `~/.plan` and update https://plan.cat/~hauleth on change
  launchd.user.agents.plan-sync.serviceConfig = {
    ProgramArguments = [
      "/usr/bin/curl"
      "--netrc-optional"
      "-F"
      "plan=&lt;/Users/hauleth/.plan"
      "https://plan.cat/stdin"
    ];

    WatchPaths = [
      "/Users/hauleth/.plan"
    ];

    StandardErrorPath = "/Users/hauleth/.local/state/launchd/logs/plan-sync.stderr";
  };
}
