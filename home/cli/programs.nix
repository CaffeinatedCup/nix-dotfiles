{ config, pkgs, inputs, ... }:
{
  # Dev stuff and basic cli tools

  programs.git = {
    enable = true;
    userName = "CaffeinatedCup";
    userEmail = "z.degidio159@gmail.com";
    extraConfig = {
      pull.rebase = false;
    };
  };


  # RSS reader, might configure later
  programs.newsboat = {
    enable = true;
    urls = [
      {
        url = "https://techcrunch.com/feed";
      }
    ];
  };

  home.packages = with pkgs; [

  # Editors & Dev Tools
  vscode-fhs
  inputs.nvim-config.packages.${system}.nvim # full config in my nvim-config repo
  tmux
  lazygit
  gcc
  gnupg
  gnumake


  # CLI Enhancement
  yazi # the goat!
  zoxide
  bat
  eza
  fd
  fzf
  ripgrep
  tokei
  tree


  # Rice
  pipes
  fastfetch
  pfetch
  cowsay
  cmatrix
  cbonsai
  fortune
  lolcat
  cava


  # System Call Monitoring
  strace # system call monitoring
  ltrace # library call monitoring
  lsof # list open files
  btop  # replacement of htop/nmon
  iotop # io monitoring
  iftop # network monitoring


  # Wayland Debugging
  wev # Wayland even viewer (for keybinds)


  # Nix Tools
  nix-output-monitor
  nvd


  # System Tools
  sysstat
  lm_sensors # for `sensors` command
  ethtool
  pciutils # lspci
  usbutils # lsusb
  ];
}
