{ config, lib, pkgs, ... }:

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
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.eza.enable = true;
  programs.lazygit.enable = true;

  home.packages = with pkgs; [

    # Rice
    pipes # Random pipes
    fastfetch # Neofetch replacement but faster
    pfetch # Minimal fetch
    cowsay
    cmatrix
    cbonsai

    fd # makes file indexing fire
    fzf # A command-line fuzzy finder
    ripgrep # recursively searches directories for a regex pattern
    wev # Wayland even viewer (for keybinds)
    gnumake

    yq-go # yaml processor https://github.com/mikefarah/yq
    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

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
  ];
}
