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

    # Noctalia
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim
    nvim-config.url = "github:CaffeinatedCup/nvim-config";

    # Zen Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # Hardware modules
    nixos-hardware.url = "github:NixOS/nixos-hardware";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs :
  {
    

    ## My nix configs ##
    nixosConfigurations = {

       pie = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./hosts/pie/default.nix
          inputs.nixos-hardware.nixosModules.raspberry-pi-4
        ];
      };


        ## liberator, the darter pro 10 ##
        liberator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/liberator/default.nix
        ];
        specialArgs = {inherit inputs; };
      };

        vulch = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vulch/default.nix
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

        #main desktop
        geeker = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/geeker/default.nix
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
