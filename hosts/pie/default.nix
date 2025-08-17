{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix
  ];

  networking.hostName = "raspberry-pi";
  system.stateVersion = "24.05";

  services.openssh.enable = true;

  users.users.zack = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    #openssh.authorizedKeys.keys = [
    #  "ssh-ed25519 AAAA...yourkey"
    #];
  };

  security.sudo.enable = true;
}

