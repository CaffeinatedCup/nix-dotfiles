# vultr vps for webserver

{ inputs, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/core
    ../../nixos/optional/traefik.nix
  ];

  networking.hostName = "vulch";

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1WMAmvGK8OPaY2Y83dwJodhLZKv5H6E24A2TjwRSmL zack@geeker"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAEyb5SxJX7OPCQOrBgKd3sJZrmqA68+sY+nIjY0GNhO zack@parted"
  ];

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

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/vda";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "512M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        root = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
