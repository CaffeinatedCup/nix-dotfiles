{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
  #enable = true;
  #catppuccin.enable = true;
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

    "/.config/fuzzel" = {
      source = ./conf/fuzzel;
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
    fuzzel #app launcher
    hyprlock #lockscreen
    hyprpicker #color picker
    mako #notification daemon
  ];
}
