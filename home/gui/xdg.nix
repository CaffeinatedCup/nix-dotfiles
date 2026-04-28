{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  environment.sessionVariables = {
  XDG_CURRENT_DESKTOP = "niri";
  XDG_SESSION_TYPE = "wayland";
};

  xdg = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.niri.default = [ "gtk" ];

    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

  #userDirs = {
   # enable = true;
   # createDirectories = true;
  #};
};

}
