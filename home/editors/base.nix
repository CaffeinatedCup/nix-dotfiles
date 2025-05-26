{config, pkgs, inputs, ... }:

{

  # Neovim
  #programs.neovim = {
   # enable = true;
   # defaultEditor = true;
   # package = inputs.nvim-config.packages.${pkgs.system}.nvim;
   # };

  # Emacs program and daemon
  programs.emacs.enable = true;
  services.emacs.enable = true;

  home.packages = with pkgs; [
  rust-analyzer
  vscode-fhs
  inputs.nvim-config.packages.${system}.nvim
  ];
}
