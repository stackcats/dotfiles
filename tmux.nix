{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    mouse = true;
    baseIndex = 1;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_theme storm
          set -g @tokyo-night-tmux_transparent 1
          set -g @tokyo-night-tmux_show_git 1
          set -g @tokyo-night-tmux_show_path 1
          set -g @tokyo-night-tmux_show_datetime 1
          set -g @tokyo-night-tmux_date_format YMD
          set -g @tokyo-night-tmux_time_format 24H
        '';
      }
    ];

    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g set-clipboard on
      set-option -g pane-base-index 1
    '';
  };
}

