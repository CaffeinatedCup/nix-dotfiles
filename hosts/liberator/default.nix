## Liberator ##
## System76 Darter Pro with NixOS and Windows ##

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/configuration.nix
    ../../nixos/core/network.nix
    ../../nixos/optional/server.nix
  ];

  networking.hostName = "liberator";

  hardware.system76.enableAll = true;
  
  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

