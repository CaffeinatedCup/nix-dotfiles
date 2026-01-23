{ config, pkgs, ... }:

{
  #wayland.windowManager.hyprland = {
  #enable = true;
  #xwayland.enable = true;
  #extraConfig = "#managed via xdg under files";
  # Empty config to silence the warning cuz I manage the conf through xdg
  #};



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
    rofi
    wl-clipboard
    #nwg-displays broken rn :(
    grim
    slurp
    gtklock
    swayidle
    xwayland-satellite
    swaybg
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [
      "-max-dedupe-search"
      "15"
      "-max-items"
      "200"
    ];
  };
}
