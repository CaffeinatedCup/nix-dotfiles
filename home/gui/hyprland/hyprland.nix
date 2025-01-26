{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
  enable = true;
  xwayland.enable = true;
  extraConfig = builtins.readFile ./conf/hyprland.conf;
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

    "/.config/rofi" = {
      source = ./conf/rofi;
      recursive = true;
    };

  };


  # Packages for hyprland
  home.packages = with pkgs; [
    waybar #status bar
    swww #changing wallpapers
    hyprpaper #wallpaper
    hypridle #idle daemon
    wlogout #logout daemon
    hyprlock #lockscreen
    hyprpicker #color picker
    mako #notification daemon
    swaybg
    rofi-wayland
  ];
}
