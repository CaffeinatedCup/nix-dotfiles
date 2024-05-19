{ config, lib, pkgs, ... }:

{
  ## Basic command utils and monitering stuff

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    # Rice stuff
    pipes
    fastfetch
    neofetch
    cowsay
    cmatrix
    cbonsai

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    fd # makes file indexing fire
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    socat # replacement of openbsd-netcat

    # misc
    file
    which
    tree
    zstd

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
