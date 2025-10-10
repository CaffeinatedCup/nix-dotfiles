## Liberator ##
## System76 Darter Pro with NixOS and Windows ##

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/optional/server.nix
    ../../nixos/core
  ];

  networking.hostName = "liberator";

  hardware.system76.enableAll = true;

  programs.zsh.enable = true;
  programs.starship.enable = true;
  programs.zsh.shellInit = ''
    export TERM=xterm256color
  '';
  
  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

