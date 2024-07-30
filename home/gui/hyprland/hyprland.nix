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

    #"/.config/fuzzel" = {
    #  source = ./conf/fuzzel;
    #  recursive = true;
    #};
  };

  programs.fuzzel.enable = true;
  lib.mkForce.programs.fuzzel.settings = {
    colors = {
    background = "1e1e2edd";
    text = "cdd6f4ff";
    match = "f38ba8ff";
    selection = "585b70ff";
    selection-match = "f38ba8ff";
    selection-text = "cdd6f4ff";
    border = "b4befeff";
    };
  };

  # Packages for hyprland
  home.packages = with pkgs; [
    waybar #status bar
    swww #changing wallpapers
    hyprpaper #wallpaper
    hypridle #idle daemon
    wlogout #logout daemon
    #fuzzel #app launcher
    hyprlock #lockscreen
    hyprpicker #color picker
    mako #notification daemon
    swaybg
    anyrun #test
    walker #test
  ];
}
