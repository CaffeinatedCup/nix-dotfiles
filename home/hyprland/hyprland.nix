{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
  enable = true;
  extraConfig = builtins.readFile ./hyprland.conf;
  };

  xdg.configFile = {
    "/waybar" = {
      source = ./conf/waybar;
      recursive = true;
    };
    
    "/.config/hypr" = {
      source = ./conf;
      recursive = true;
    };

    "/.config/fuzzel" = {
      source = ./conf/fuzzel;
      recursive = true;
    };
  };
}
