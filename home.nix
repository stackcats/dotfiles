{
  pkgs,
  config,
  lib,
  ...
}:
{

  imports = [
    ./tmux.nix
    ./fish.nix
  ];

  home.username = "stackcats";
  home.homeDirectory = "/home/stackcats";
  home.stateVersion = "24.11";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  home.packages = with pkgs; [
    devenv
    which
    autojump
    fish
    tmux
    starship
    neovim
    rustup
    lazygit
    wakatime-cli
    ripgrep
    fd
    xdg-utils
    tree-sitter

    gcc

    # lang tools
    lua-language-server
    selene
    stylua

    nixd
    nixfmt

    haskell-language-server

    isort
    black
    mypy
  ];

  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";

  };

  programs = {
    home-manager.enable = true;
    starship.enable = true;
  };
}
