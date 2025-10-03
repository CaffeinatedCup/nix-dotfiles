## Liberator ##
## System76 Darter Pro with NixOS and Windows ##

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/core/network.nix
    ../../nixos/optional/server.nix
  ];

  networking.hostName = "liberator";

  hardware.system76.enableAll = true;

  programs.zsh.enable = true;
  programs.starship.enable = true;
  
  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

