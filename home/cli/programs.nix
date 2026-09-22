{ config, pkgs, inputs, ... }:
{
  # Dev stuff and basic cli tools

  programs.git = {
    enable = true;
    signing.format = null;
    settings = {
      user.name = "CaffeinatedCup";
      user.email = "z.degidio159@gmail.com";
      pull.rebase = false;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    silent = true;
  };

  programs.crush = {
  enable = true;
  settings = {
    providers.openrouter = {
      type = "openai-compat";
      base_url = "https://openrouter.ai/api/v1";
      api_key = "$(cat /run/agenix/openrouter-api-key)";
      models = [
        {
          id = "~deepseek/deepseek-pro-latest";
          name = "DeepSeek V3 (latest)";
        }
      ];
    };
    models.deepseek = {
      provider = "openrouter";
      model = "~deepseek/deepseek-pro-latest";
    };
  };
};

  age.secrets.openrouter-api-key = {
    file = ../../secrets/openrouter-api-key.age;
    owner = "zack";
  };



  home.packages = with pkgs; [

  # Editors & Dev Tools
  ffmpeg
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


  # CLI Enhancement
  yazi
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
  wev # Wayland even viewer (for keybinds)


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
  ];
}
