{ config, pkgs, ... }:
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

  home.packages = with pkgs; [

  # Editors
  vscode-fhs
  # Full config at github/CaffeinatedCup/nvim-config
  inputs.nvim-config.packages.${system}.nvim

  # Just packages for now, but might configure later
  tmux
  alacritty
  lazygit
  yazi


  zoxide
  bat
  eza
  ];
}
