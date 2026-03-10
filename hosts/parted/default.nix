## Liberator ##
## System76 Darter Pro with NixOS and Windows ##

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/configuration.nix
  ];

  networking.hostName = "parted";

  # Sets iwd as the backend because wpa supplicant seems to disconnect on laptops
  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd.enable = true;

  services.fwupd.enable = true;

  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

