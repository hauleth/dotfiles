{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix search nixpkgs wget
  environment.systemPackages = with pkgs; [
    # _1password
    asciinema
    bat
    comby
    coreutils
    entr
    findutils
    fswatch
    fzy
    gnupg
    jq
    lima
    lnav
    neovim-remote
    noti
    pinentry_mac
    # qmk
    rage
    ripgrep
    rnix-lsp
    senpai
  ];

  environment.shells = [pkgs.fish pkgs.zsh];

  environment.variables = {
    LESS = "-SRFXi";
    ERL_FLAGS = "-kernel shell_history enabled";
  };

  programs.nix-index.enable = true;
  programs.fish.enable = true;
}
