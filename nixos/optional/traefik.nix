{
  services.traefik = {
    enable = true;


    staticConfigOptions = { 
      api = {}; 
      entryPoints = {
        web = {
          address = ":80";
          http.redirections.entrypoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {
          address = ":443";
        };
      }; 

      certificatesResolvers.le.acme = {
        email = "z.degidio159@gmail.com";
        storage = "/var/lib/traefik/acme.json";
        caserver = "https://acme-v02.api.letsencrypt.org/directory";
        httpChallenge.entryPoint = "web";
      };
    };

    dynamicConfigOptions.http = {
      middlewares.ws-headers.headers.customRequestHeaders = {
        Upgrade = "websocket";
        Connection = "Upgrade";
      };
      routers = {
        memos = {
          rule = "Host(`memos.zacharydegidio.com`)";
          service = "memos";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";

        };
        actual = {
          rule = "Host(`actual.zacharydegidio.com`)";
          service = "actual";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        vaultwarden = {
          rule = "Host(`vault.zacharydegidio.com`)";
          service = "vaultwarden";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        mealie = {
          rule = "Host(`mealie.zacharydegidio.com`)";
          service = "mealie";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        nextcloud = {
          rule = "Host(`nextcloud.zacharydegidio.com`)";
          service = "nextcloud";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        remark = {
          rule = "Host(`remark.zacharydegidio.com`)";
          service = "rmfakecloud";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
          middlewares = [ "ws-headers" ];
        };
        nginx = {
          rule = "Host(`zacharydegidio.com`)";
          service = "nginx";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        ai = {
          rule = "Host(`ai.zacharydegidio.com`)";
          service = "open-webui";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        rss = {
          rule = "Host(`rss.zacharydegidio.com`)";
          service = "freshrss";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        home = {
          rule = "Host(`home.zacharydegidio.com`)";
          service = "homepage";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
      };
      services.memos.loadBalancer.servers = [
        { url = "http://100.71.212.63:5230"; }
      ];
      services.actual.loadBalancer.servers = [
        { url = "http://100.71.212.63:3000"; }
      ];
      services.vaultwarden.loadBalancer.servers = [
        { url = "http://100.71.212.63:8222"; }
      ];
      services.mealie.loadBalancer.servers = [
        { url = "http://100.71.212.63:9000"; }
      ];
      services.nextcloud.loadBalancer.servers = [
        { url = "http://100.71.212.63:80"; }
      ];
      services.rmfakecloud.loadBalancer.servers = [
        { url = "http://100.71.212.63:8081"; }
      ];
      services.nginx.loadBalancer.servers = [
        { url = "http://100.71.212.63:8080"; }
      ];
      services.open-webui.loadBalancer.servers = [
        { url = "http://100.71.212.63:8085"; }
      ];
      services.freshrss.loadBalancer.servers = [
        { url = "http://100.71.212.63:8086"; }
      ];
      services.homepage.loadBalancer.servers = [
        { url = "http://100.71.212.63:8082"; }
      ];
    };

  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
