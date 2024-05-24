{
  description = "Zack's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

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


    };
  };
}
