{ config, lib, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Network packages
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    socat
  ];

  # Sets iwd as the backend because wpa supplicant seems to disconnect
  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.tailscale = {
    enable = true;
    };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 41641 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
