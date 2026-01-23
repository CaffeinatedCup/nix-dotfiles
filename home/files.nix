{ config, pkgs, ... }:
{
  xdg.configFile = {

  "hypr/hyprland.conf".source = ./files/hypr/hyprland.conf;
  "hypr/hyprlock.conf".source = ./files/hypr/hyprlock.conf;
  "hypr/hypridle.conf".source = ./files/hypr/hypridle.conf;
  "hypr/hyprpaper.conf".source = ./files/hypr/hyprpaper.conf;

  #"kitty/kitty.conf".source = ./files/kitty/tokyo-night.conf;

  "waybar/config".source = ./files/waybar/config;
  "waybar/style.css".source = ./files/waybar/style.css;

  "rofi/config.rasi".source = ./files/rofi/config.rasi;

  "niri/config.kdl".source = ./files/niri/config.kdl;
  };

}
