{ config, pkgs, nix-colors, ... }:

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

  #application launcher
  programs.fuzzel = {
    enable = true;
    settings = {
      colors = {
        background = "0x${config.colorScheme.palette.base05}";
        text = "0x${config.colorScheme.palette.base05}";
        match = "0x${config.colorScheme.palette.base0C}";
        selection = "0x${config.colorScheme.palette.base05}";
        selection-match = "0x${config.colorScheme.palette.base05}";
        selection-text = "0x${config.colorScheme.palette.base05}";
        border = "0x${config.colorScheme.palette.base0E}";
      };
    };
  };

  #programs.rofi.enable = true;

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
