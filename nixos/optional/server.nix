{ inputs, pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    librsvg
    imagemagick
    hugo
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  virtualisation.docker.enable = true;

  age.secrets.vaultwarden-admin-token = {
    file = ../../secrets/vaultwarden-admin-token.age;
    owner = "vaultwarden";
  };
  age.secrets.nextcloud-admin-pass = {
    file = ../../secrets/nextcloud-admin-pass.age;
    owner = "nextcloud";
  };
  age.secrets.freshrss-password = {
    file = ../../secrets/freshrss-password.age;
    owner = "freshrss";
  };

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
      ADMIN_TOKEN_FILE = config.age.secrets.vaultwarden-admin-token.path;
      LOG_FILE = "/var/lib/bitwarden_rs/access.log";
    };
  };

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    hostName = "nextcloud.zacharydegidio.com";
    config = {
      adminpassFile = config.age.secrets.nextcloud-admin-pass.path;
      dbtype = "sqlite";
    };
    settings = {
      trusted_domains = [ "nextcloud.zacharydegidio.com" ];
      trusted_proxies = [ "100.71.212.63" ];
      overwriteprotocol = "https";
    };
  };

  services.rmfakecloud = {
    enable = true;
    port = 8081;
    storageUrl = "https://remark.zacharydegidio.com";
    extraSettings = {
      LOGLEVEL = "debug";
    };
  };

  services.ollama = {
    enable = true;
  };

  services.open-webui = {
    enable = true;
    port = 8085;
    environment = {
      OLLAMA_BASE_URL = "http://127.0.0.1:11434";
      WEBUI_AUTH = "true";
    };
  };

  services.freshrss = {
    enable = true;
    virtualHost = "rss.zacharydegidio.com";
    baseUrl = "https://rss.zacharydegidio.com";
    defaultUser = "zack";
    passwordFile = config.age.secrets.freshrss-password.path;
  };

  services.nginx = {
    enable = true;
    virtualHosts = {
      "mysite" = {
        root = "/var/www/mysite";
        listen = [{ addr = "0.0.0.0"; port = 8080; }];
        locations."/" = { index = "index.html"; };
      };
      "rss.zacharydegidio.com" = {
        listen = [{ addr = "0.0.0.0"; port = 8086; }];
      };
    };
  };

  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    services = [
      {
        "Media & AI" = [
          { "Open WebUI" = { href = "https://ai.zacharydegidio.com"; }; }
          { "Memos" = { href = "https://memos.zacharydegidio.com"; }; }
        ];
      }
      {
        "Tools" = [
          { "FreshRSS" = { href = "https://rss.zacharydegidio.com"; }; }
          { "Vaultwarden" = { href = "https://vault.zacharydegidio.com"; }; }
          { "Mealie" = { href = "https://mealie.zacharydegidio.com"; }; }
          { "Nextcloud" = { href = "https://nextcloud.zacharydegidio.com"; }; }
          { "Actual" = { href = "https://actual.zacharydegidio.com"; }; }
        ];
      }
    ];
  };

  networking.firewall.allowedTCPPorts = [ 80 5230 3000 8222 9000 8081 8080 8082 8085 8086 ];
}
