{
  description = "Zack's NixOS configuration";

  inputs = {
    # Nix packages (unstable)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manger
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim
    nvim-config.url = "github:CaffeinatedCup/nvim-config";

    # Zen Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs :
  {
    

    ## My nix configs ##
    nixosConfigurations = {

      raspberry-pi = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./hosts/raspberry-pi/default.nix
        ];
      };


        ## liberator, the darter pro 10 ##
        liberator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/liberator/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zack = {
              imports = [
                ./home/home.nix
              ];
            };
          }
        ];
        specialArgs = {inherit inputs; };
      };


        ## parted, framework laptop  ##
        parted = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/parted/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.zack = {
              imports = [
                ./home/home.nix
              ];
            };
          }
        ];
        specialArgs = {inherit inputs; };
      };
    };
  };
}
