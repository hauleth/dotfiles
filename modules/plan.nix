{ pkgs, ... }: {
  launchd.agents.plan-sync = {
    enable = pkgs.stdenv.isDarwin;
    config = {
      Label = "plan-sync";

      ProgramArguments = [
        "${pkgs.curl}/bin/curl"
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
  };
}
