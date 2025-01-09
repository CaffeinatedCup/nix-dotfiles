{ config, lib, pkgs, nix-colors, ... }:

{
  # Git, emulators, and rice stuff

  programs.git = {
    enable = true;
    userName = "ChineseFriend101";
    userEmail = "z.degidio159@gmail.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  ## All these are programs I want but have yet to configure

  programs.tmux.enable = true;

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      color0 = "#${config.colorScheme.palette.base02}";
      color1 = "#${config.colorScheme.palette.base08}";
      color2 = "#${config.colorScheme.palette.base0B}";
      color3 = "#${config.colorScheme.palette.base0A}";
      color4 = "#${config.colorScheme.palette.base0D}";
      color5 = "#${config.colorScheme.palette.base0E}";
      color6 = "#${config.colorScheme.palette.base0C}";
      color7 = "#${config.colorScheme.palette.base06}";
      color8 = "#${config.colorScheme.palette.base03}";
      color9 = "#${config.colorScheme.palette.base09}";
      color10 = "#${config.colorScheme.palette.base0B}";
      color11 = "#${config.colorScheme.palette.base0A}";
      color12 = "#${config.colorScheme.palette.base0D}";
      color13 = "#${config.colorScheme.palette.base0E}";
      color14 = "#${config.colorScheme.palette.base0C}";
      color15 = "#${config.colorScheme.palette.base06}";
      
      background_opacity = "0.93";
      enable_audio_bell = false;
      };

  };

  programs.alacritty.enable = true;

  # cd replacement
  programs.zoxide.enable = true;
  # cat replacement
  programs.bat.enable = true;
  # ls replacement
  programs.eza.enable = true;
  # git ui for terminal
  programs.lazygit.enable = true;

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
    ventoy
  ];
}
