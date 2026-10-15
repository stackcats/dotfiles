{ pkgs, ... }: {

  programs.starship = {
    enable = true;

    settings = {
      custom.project_name = {
        command = "echo $(shortpath $DEVENV_ROOT)";
        when = true;
        format = "[$output](bold cyan) ";
      };
      nix_shell.format = "via [$symbol$state]($style) ";
    };
  };
}
