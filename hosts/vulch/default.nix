# vultr vps for webserver

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/core
  ];

  networking.hostName = "vulch";

  programs.zsh.enable = true;
  programs.starship.enable = true;
  programs.zsh.shellInit = ''
    export TERM=xterm-256color
  '';
  
  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

