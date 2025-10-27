{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  docker-compose
  ];

  virtualisation.docker.enable = true;

  services.memos = {
    enable = true;
    settings = {
        MEMOS_MODE = "prod";
        MEMOS_ADDR = "0.0.0.0";
        MEMOS_PORT = "5230";
        MEMOS_DATA = "/var/lib/memos";
        MEMOS_DRIVER = "sqlite";
        MEMOS_INSTANCE_URL = "http://192.168.1.162:5230";
    };
  };

  services.actual = {
    enable = true;
    settings = {
      hostname = "0.0.0.0";
    };
  };

  services.mealie = {
    enable = true;
  };

  services.vaultwarden = {
    enable = true;
  };

  #open firewall for memos
  networking.firewall.allowedTCPPorts = [ 5230 3000 ];

}
