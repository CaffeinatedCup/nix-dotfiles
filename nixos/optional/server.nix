{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  docker-compose
  ];

  virtualisation.docker.enable = true;

  services.memos = {
    enable = true;
  };

  services.actual = {
    enable = true;
    #default port is 3000
  };

  services.vaultwarden = {
    enable = true;
  };

  #open firewall for memos
  networking.firewall.allowedTCPPorts = [ 5230 ];

}
