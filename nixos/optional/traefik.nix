{
  services.traefik = {
    enable = true;


    staticConfigOptions = { 
      api = {}; 
      entryPoints = {
        web = {
          address = ":80";
          http.redirections.entryPoints = {
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
          rule = "Host('memos.zacharydegidio.com')";
          service = "memos";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";

        };
        actual = {
          rule = "Host('actual.zacharydegidio.com')";
          service = "actual";
          entryPoints = [ "websecure" ];
          tls.certResolver = "le";
        };
      };
      services.memos.loadBalancer.servers = [
        { url = "https://192.168.1.162:5230"; }
      ];
      services.actual.loadBalancer.servers = [
        { url = "https://192.168.1.162:5006"; }
      ];
    };

  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
