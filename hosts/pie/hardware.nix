{ config, pkgs, ... }: {
  boot.loader.generic-extlinux-compatible.enable = true;

  fileSystems."/" = {
    device = "/dev/mmcblk0p2";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/mmcblk0p1";
    fsType = "vfat";
  };
}

