# vultr vps for webserver

{ inputs, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/core
    ../../nixos/optional/traefik.nix
  ];

  networking.hostName = "vulch";

  programs.zsh.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      line_break.disabled = true;
      add_newline = false;
    };
  };

  environment.variables = {
    TERM = "xterm-256color";
  };
  
  boot.tmp.useTmpfs = false;

  boot.initrd.includeDefaultModules = false;
  hardware.enableRedistributableFirmware = lib.mkForce false;
  hardware.enableAllHardware = false;

  # UEFI boot
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

