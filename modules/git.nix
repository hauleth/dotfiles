{ pkgs, inputs, ... }: {
  programs.gh = {
    enable = true;

    settings.aliases.co = "pr checkout";
  };

  home.packages = with pkgs; [
    git-gone
    git-revise
    gitAndTools.git-imerge
    gitAndTools.git-test
    gitAndTools.tig
  ];

  programs.git = {
    enable = true;

    diff-so-fancy.enable = true;
    lfs.enable = true;

    attributes = [
      "*.ex diff=elixir"
      "*.exs diff=elixir"
      "mix.lock merge=binary"

      "*.erl diff=erlang"
      "*.hrl diff=erlang"
      "rebar.lock merge=binary"

      "*.tex diff=tex"

      "*.rs diff=rust"
      "Cargo.lock merge=binary"

      "*.css diff=css"

      "*.md diff=markdown"

      "flake.lock merge=binary"
    ];

    ignores = inputs.self.lib.readFileWithComments ./git/ignore;

    aliases = {
      b = "branch";
      ca = "commit --amend";
      ci = "commit";
      rci = "commit --amend --reuse-message HEAD";

      lg = "log --color --graph --abbrev-commit --pretty=simple-oneline";

      squash = "rebase --interactive --autosquash @{upstream}";
      update = "!git rebase -i \"$(git merge-base HEAD \"$(git default-branch)\")\"";

      st = "status -sb";
      todo = "grep -Ee '\\\\bTODO:?\\\\b'";
      fixme = "grep -Ee '\\\\bFIX(ME)?:?\\\\b'";

      default-branch = "!git symbolic-ref --short refs/remotes/origin/HEAD | sed 's|^origin/||'";

      cleanup = "!git branch --format=\"%(if:notequals=*)%(HEAD)%(then)%(if:notequals=\${1:-$(git default-branch)})%(refname:lstrip=2)%(then)%(refname:lstrip=2)%(end)%(end)\" --merged \"\$(git default-branch)\" | xargs -rpxL1 git branch -d";
    };

    extraConfig = {
      core.commitGraph = true;

      init.defaultBranch = "master";

      user.useConfigOnly = true;

      merge = {
        ff = false;
        conflictstyle = "diff3";
      };

      branch.autoSetupRebase = "always";

      commit = {
        gpgSign = true;
        verbose = true;
        cleanup = "scissors";
      };

      diff = {
        indentHeuristic = true;
        algorithm = "histogram";
        mnemonicPrefix = true;

        tool = "difftastic";

        markdown.xfuncname = "^(#+\\s+.*)$";
      };

      difftool = {
        prompt = false;

        difftastic.cmd = "${pkgs.difftastic}/bin/difft \"$LOCAL\" \"$REMOTE\"";
      };

      pager.difftool = true;

      fetch.prune = true;

      tag = {
        forceSignAnnotated = true;
        sort = "version:refname";
      };

      versionsort.suffix = [ "" "-rc" "-pre" ];

      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
        gpgSign = "if-asked";
      };

      pull = {
        rebase = true;
        twohead = "ort";
      };

      rebase = {
        autostash = true;
        autosquash = true;
        updateRefs = true;
      };

      pretty = {
        simple-oneline = "%C(yellow)%h%C(auto)%d %s [%C(green)%aN <%aE>%C(reset)] (%C(blue)%ar%C(reset))";
        simple-oneline-sign = "%C(yellow)%h%C(auto)%d %s [%C(green)%aN <%aE>%C(reset)] (%C(blue)%ar%C(reset)) %G?";
      };
    };
  };
}
