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

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # 你的系统架构
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."stackcats" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # 指定你的主配置文件
        modules = [ ./home.nix ];
      };
    };
}
