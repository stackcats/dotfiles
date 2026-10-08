{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    functions = {
      dtu = {
        description = "dash to underscore";
        body = ''
          for arg in $argv
            echo (string replace -a '-' '_' -- $arg)
          end
        '';
      };

      leet = {
        body = ''
          if test (count $argv) -eq 0
            echo "Usage: leet <filename>"
            return 1
          end

          set filename (dtu $argv[1])
          nvim $filename
        '';
      };
    };

    shellAbbrs = {
      vi = "nvim";
      gst = "git status";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""

      if status is-interactive
          if not set -q TMUX
              tmux attach -t main 2>/dev/null; or tmux new -s main
          end
      end
    '';
  };

  programs.autojump = {
    enable = true;
    enableFishIntegration = true;
  };
}
