{ config, lib, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.niri.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = false;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];

      config.common = {
        default = [ "gtk"];
      };
    };

    services.gvfs.enable = true;
    services.udisks2.enable = true;

    security.polkit.enable = true;
}
