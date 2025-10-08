{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  docker-compose
  ];

  virtualization.docker.enable = true;

  users.users.zack.extraGroups = [ "docker" ];

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

}
