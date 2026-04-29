{ lib, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.niri.enable = true;

  environment.sessionVariables = {
  XDG_CURRENT_DESKTOP = "niri";
  XDG_SESSION_TYPE = "wayland";
  };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = false;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      config = {
        niri.default = lib.mkForce ["gtk"];
        common.default = ["gtk"];
      };
    };

    services.gvfs.enable = true;
    services.udisks2.enable = true;

    security.polkit.enable = true;
}
