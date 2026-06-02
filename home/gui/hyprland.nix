{ pkgs, ... }:
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
    awww #changing wallpapers
    hyprpaper #wallpaper
    hypridle #idle daemon
    wlogout #logout daemon
    hyprlock #lockscreen
    hyprpicker #color picker
    mako #notification daemon
    swaybg
    rofi
    wl-clipboard
    librsvg
    #nwg-displays broken rn :(
    grim
    slurp
    gtklock
    swayidle
    swaylock-effects
    xwayland-satellite
    swaybg

    # Just a shell script for my swaylock command
    (pkgs.writeShellScriptBin "zlock" ''
      exec ${pkgs.swaylock-effects}/bin/swaylock -fF \
        --effect-blur 7x5 --clock --indicator \
        --image /home/zack/Pictures/wallpapers/dark-pixel-mountain.jpg
    '')
  ];

  services.swayidle = {
    enable = true;
    extraArgs = [ "-w" ]; # respect wayland idle inhibitors (e.g. browser video playback)
    events = [
      { event = "before-sleep"; command = "zlock"; }
      { event = "lock";         command = "zlock"; }
    ];
    timeouts = [
      {
        timeout = 600; # 10 minutes → lock
        command = "zlock";
      }
      {
        timeout = 900; # 15 minutes → suspend
        command = "systemctl suspend";
      }
    ];
  };

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
