{
  description = "Home Manager configuration of your-username on Arch Linux";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # 强制 home-manager 与你定义的 nixpkgs 版本保持一致
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      pkgsFor = nixpkgs.lib.genAttrs systems (system: import nixpkgs { inherit system; });
    in
    {
      homeConfigurations = {
        "stackcats@pc" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;

          modules = [ ./home.nix ];
        };

        "stackcats@pi" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor.aarch64-linux;

          modules = [ ./home.nix ];
        };
      };
    };
}
