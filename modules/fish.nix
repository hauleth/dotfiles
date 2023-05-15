{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "agnoster";
        src = pkgs.fetchFromGitHub {
          owner = "hauleth";
          repo = "agnoster";
          rev = "master";
          sha256 = "0/FgJlQULIXKhQIt3z3ugAGubgMlwFZa/cjGjiq7BcA=";
        };
      }
    ];

    shellAliases = {
      git = "LC_CTYPE=UTF-8 LANG=C command git";
      g = "git";
    };

    functions = {
      p = ''
        if test (count $argv) -gt 0 && test -f $argv[1] || not isatty
          bat $argv
        else
          ls -Alh $argv
        end
      '';
      ix = "curl --netrc-optional -F 'f:1=@-' ix.io | pbcopy";
    };

    loginShellInit = ''
      fish_add_path --move --path $HOME/.nix-profile/bin /run/wrappers/bin /etc/profiles/per-user/$USER/bin /nix/var/nix/profiles/default/bin /run/current-system/sw/bin
    '';

    shellInit = ''
      set -gx XDG_RUNTIME_DIR (getconf DARWIN_USER_TEMP_DIR)
      set -gx MIX_XDG 1

      set -g fish_greeting

      function e --wraps nvim --description 'Run $EDITOR'
        $EDITOR $argv
      end

      ulimit -n 10480
    '';

    interactiveShellInit = ''
      # use fish in nix run and nix-shell
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

      set -g DEFAULT_USER ${config.home.username}

      set -gx SSH_AUTH_SOCK ~/.local/share/1password/auth.sock

      source (${pkgs.lima}/bin/limactl completion fish | psub)
      source $HOME/.op/plugins.sh

      if which op > /dev/null; source (op completion fish | psub); end

      test -e $HOME/.iterm2_shell_integration.fish ; and source $HOME/.iterm2_shell_integration.fish
    '';
  };
}
