{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  home.sessionVariables = {
  QT_QPA_PLATFORMTHEME = "gtk3";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

    xdg.configFile."gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-icon-theme-name=Adwaita
      gtk-cursor-theme-name=Bibata-Modern-Ice
      gtk-cursor-theme-size=24
    '';

    xdg.configFile."gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-icon-theme-name=Adwaita
      gtk-cursor-theme-name=Bibata-Modern-Ice
      gtk-cursor-theme-size=24
    '';
}
