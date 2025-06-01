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

  # Editors
  vscode-fhs
  # Full config at github/CaffeinatedCup/nvim-config
  inputs.nvim-config.packages.${system}.nvim

  # Just packages for now, but might configure later
  tmux
  lazygit


  zoxide
  bat
  eza


  # File browsing
  yazi
  pcmanfm


  #devtools
  gcc
  gnupg
  gnumake


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


  # Need to organize
  fd # makes file indexing fire
  fzf # A command-line fuzzy finder
  ripgrep # recursively searches directories for a regex pattern
  wev # Wayland even viewer (for keybinds)

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
