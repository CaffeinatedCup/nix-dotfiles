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
        mealie = {
          rule = "Host(`mealie.zacharydegidio.com`)";
          service = "mealie";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
        website = {
          rule = "Host(`zacharydegidio.com`)";
          service = "nginx";
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

      services.mealie.loadBalancer.servers = [
        { url = "http://100.71.212.63:9000"; }
      ];
      services.website.loadBalancer.servers = [
        { url = "http://100.71.212.63:8080"; }
      ];
    };

  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
