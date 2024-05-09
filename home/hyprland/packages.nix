{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    waybar #status bar
    swww #moving wallpaper
    hypridle #idle daemon
    wlogout #logout daemon
    fuzzel #app launcher
    hyprlock #lockscreen
    hyprpicker #color picker
    mako #notification daemon
  ];
}
