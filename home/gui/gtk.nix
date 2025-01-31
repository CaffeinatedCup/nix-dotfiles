{ config, pkgs, ... }:

{
  gtk.enable = true;

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

    xdg.configFile."gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-cursor-theme-name=Bibata-Modern-Ice
      gtk-cursor-theme-size=24
    '';

    xdg.configFile."gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-cursor-theme-name=Bibata-Modern-Ice
      gtk-cursor-theme-size=24
    '';
}
