## Liberator ##
## System76 Darter Pro with NixOS and Windows ##

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/core/network.nix
    ../../nixos/optional/server.nix
    ../..nixos/core/nix.nix
    ../..nixos/core/networking.nix
  ];

  networking.hostName = "liberator";

  hardware.system76.enableAll = true;

  programs.zsh.enable = true;
  programs.starship.enable = true;
  programs.zsh.shellInit = ''
    export TERM=xterm
  '';
  
  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

