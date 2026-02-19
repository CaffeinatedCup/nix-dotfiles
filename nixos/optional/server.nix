{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  docker-compose
  hugo
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
    dbBackend = "sqlite";
    config = {
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      DOMAIN = "https://vault.zacharydegidio.com";
      SIGNUPS_ALLOWED = true;
      ADMIN_TOKEN = "$argon2id$v=19$m=65540,t=3,p=4$xadn53Y4bnvxClYToMYwCA7ErVwtF/A23NcBRJRbufI$RGqRs/zSxbUDVf1Npt5qlmOQwh9c7haJK0Hq9XZ3Dbk";
      LOG_FILE = "/var/lib/bitwarden_rs/access.log";
    };
  };


  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    hostName = "nextcloud.zacharydegidio.com";

    config = {
      adminpassFile = "/etc/nextcloud/admin-pass";
      dbtype = "sqlite";
    };
    extraOptions = {
      trusted_domains = [ "nextcloud.zacharydegidio.com" ];
      trusted_proxies = [ "100.71.212.63" ];
      overwriteprotocol = "https";
    };
  };


  services.rmfakecloud = {
  enable = true;
  port = 8081;
  storageUrl = "https://remark.zacharydegidio.com";
  };

  # add minecraft

  services.nginx = {
    enable = true;
    virtualHosts = {
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
