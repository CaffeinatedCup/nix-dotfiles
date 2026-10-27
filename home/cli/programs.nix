{ pkgs, inputs, ... }:
{
  # Dev stuff and basic cli tools

  programs = {
    git = {
      enable = true;
      signing.format = null;
      settings = {
        user.name = "CaffeinatedCup";
        user.email = "z.degidio159@gmail.com";
        pull.rebase = false;
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
      silent = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
    };


    crush = {
    enable = true;
      settings = {
        providers.openrouter.api_key = "$(cat /run/agenix/openrouter-api-key)";
      };
    };
  };


  home.packages = with pkgs; [


  # Dev Tools
  ffmpeg
  pandoc
  tectonic
  python313
  python313Packages.pip
  inputs.nvim-config.packages.${pkgs.stdenv.hostPlatform.system}.nvim # full config in my nvim-config repo
  tmux
  lazygit
  gcc
  gnupg
  gnumake
  platformio-core
  iw
  cmake # remove eventually, should be confined to a dev shell
  octaveFull
  picocom
  hugo
  quickshell


  # CLI Enhancement
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
  figlet


  # System Call Monitoring
  strace # system call monitoring
  #ltrace # library call monitoring
  lsof # list open files
  btop  # replacement of htop/nmon
  iotop # io monitoring
  iftop # network monitoring


  # Wayland Debugging
  wev # Wayland event viewer (for keybinds)


  # Nix Tools
  nix-output-monitor
  nvd


  # System Tools
  mpv #media player
  sysstat
  lm_sensors # for `sensors` command
  ethtool
  pciutils # lspci
  usbutils # lsusb
  udiskie
  ];
}
