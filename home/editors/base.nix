{config, pkgs, inputs, ... }:

{

  # Emacs program and daemon
  programs.emacs.enable = true;
  services.emacs.enable = true;

  home.packages = with pkgs; [
  rust-analyzer
  vscode-fhs
  inputs.nvim-config.packages.${system}.nvim
  ];
}
