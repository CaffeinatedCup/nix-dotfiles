{pkgs, pkgs-unstable, ... }:

{
  # TODO add nix code to integrate neovim config here


  # Neovim and make default
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # Emacs program and daemon
  programs.emacs.enable = true;
  services.emacs.enable = true;

  home.packages = with pkgs; [
  rust-analyzer
  vscode-fhs
  ];
}
