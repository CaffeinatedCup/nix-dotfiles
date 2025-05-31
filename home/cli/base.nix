{ config, lib, pkgs, ... }:

{
  # Git, emulators, and rice stuff


  ## All these are programs I want but have yet to configure

  programs.kitty = {
    
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      include = "~/nix-dotfiles/home/gui/hyprland/conf/kitty/tokyo-night.conf";
      
      background_opacity = "0.93";
      enable_audio_bell = false;
      };

  };


  home.packages = with pkgs; [

    # Rice
    pipes # Random pipes
    fastfetch # Neofetch replacement but faster
    pfetch # Minimal fetch
    cowsay
    cmatrix
    cbonsai
    fortune
    lolcat
    cava

    fd # makes file indexing fire
    fzf # A command-line fuzzy finder
    ripgrep # recursively searches directories for a regex pattern
    wev # Wayland even viewer (for keybinds)
    gnumake

    yq-go # yaml processor https://github.com/mikefarah/yq

    # nix related
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
    # Allows you to see changes in nix stuff
    nvd

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    tokei

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
