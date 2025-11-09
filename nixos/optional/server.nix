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

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    hostName = "nextcloud.zacharydegidio.com";
    https = false;

    config = {
      adminpassFile = "/etc/nextcloud/admin-pass";
      dbtype = "sqlite";
      extraTrustedDomains = [ "nextcloud.zacharydegidio.com" ];
      trusted_proxies = [ "100.124.164.29" ];
      overwriteprotocol = "https";
      overwritehost = "nextcloud.zacharydegidio.com";
      default_phone_region = "US";
    };
  };


  # add rmfakecloud

  # add minecraft

  services.nginx = {
    enable = true;
    virtualHosts = {
      "nextcloud" = {
        listen = [ { addr = "0.0.0.0"; port = 8081; } ]; # changed bc webserver uses 8080
      };
      "mywebsite" = {
        root = "/var/www/mywebsite";
        listen = [{ addr = "0.0.0.0"; port = 8080; }];
        locations."/" = { index = "index.html"; };
      };
    };
  };

  #open firewall for memos
  networking.firewall.allowedTCPPorts = [ 5230 3000 ];

}
