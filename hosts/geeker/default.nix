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

  networking.networkmanager.wifi.backend = "wpa_supplicant";
  networking.wireless.iwd.enable = false;
  networking.networkmanager.wifi.powersave = false;

  hardware.cpu.amd.updateMicrocode = true;

  # disabled hardway encrytion for wifi card (twas getting stalls)
  boot.extraModprobeConfig = ''
  options ath9k nohwcrypt=1
  '';


  # UEFI boot
  boot.loader.systemd-boot.enable = true;
  #boot.loader.grub.enable = true;
  #boot.loader.grub.devices = [ "nodev" ];
  #boot.loader.grub.useOSProber = true;
  #boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
}

