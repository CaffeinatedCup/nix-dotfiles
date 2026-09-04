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
  
  boot = {
    tmp.useTmpfs = false;
    initrd.includeDefaultModules = false;
    #UEFI boot
    loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        useOSProber = true;
        efiSupport = true;
      };
    efi.canTouchEfiVariables = true;
    };
  };

  hardware.enableRedistributableFirmware = lib.mkForce false;
  hardware.enableAllHardware = false;

}

