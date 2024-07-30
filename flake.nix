{
  description = "Zack's NixOS configuration";

  inputs = {
    # Nix packages (unstable and latest stable)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manger
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    # Nixvim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix (theming)
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.inputs.home-manager.follows = "home-manager";

  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {


    ## My nix configs ##
    nixosConfigurations = {


        ## thinker, the old thinkpad ##
        thinker = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/thinker/default.nix
          inputs.stylix.nixosModules.stylix
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

          { _module.args = {inherit inputs; };}
        ];
      };


        ## liberator, the darter pro 10 ##
        liberator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/liberator/default.nix
          inputs.stylix.nixosModules.stylix
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

          { _module.args = {inherit inputs; };}
        ];
      };


    };
  };
}
