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

    # Nix Colors (test)
    nix-colors.url = "github:misterio77/nix-colors";

  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {

    ## My nix configs ##
    nixosConfigurations = {


        ## thinker, the old thinkpad ##
        thinker = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs; };
        modules = [
          ./hosts/thinker/default.nix
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
	    extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zack = {
              imports = [
                inputs.nix-colors.homeManagerModules.default
                ./home/home.nix
              ];
            };
          }

          #{ _module.args = {inherit inputs; };}
        ];
      };


        ## liberator, the darter pro 10 ##
        liberator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs; };
        modules = [
          ./hosts/liberator/default.nix
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zack = {
              imports = [
                inputs.nix-colors.homeManagerModules.default
                ./home/home.nix
              ];
            };
          }

          #{ _module.args = {inherit inputs; };}

        ];
      };


    };
  };
}
