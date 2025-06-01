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
  alacritty
  lazygit


  zoxide
  bat
  eza


  # File browsing
  yazi
  pcmanfm
  ];
}
