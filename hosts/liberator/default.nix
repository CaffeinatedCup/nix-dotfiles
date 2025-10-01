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

  # Boot stuff specific to Darter Pro's Intel Arc
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "i915" ];

  hardware.system76.enableAll = true;
  
  hardware = {
    opengl.enable = true;
    opengl.extraPackages = with pkgs; [
    intel-compute-runtime 
    vaapiIntel
    ];
  };
  
  environment.systemPackages = with pkgs; [ mesa ];

  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

