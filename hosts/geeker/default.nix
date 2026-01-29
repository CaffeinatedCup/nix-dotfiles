## Geeker ##
## AMD desktop with NixOS and Windows ##

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/configuration.nix
  ];

  networking.hostName = "geeker";
  services.xserver.videoDrivers = ["amdgpu"];

  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

