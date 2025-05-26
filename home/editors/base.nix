{config, pkgs, inputs, ... }:

{

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    };

  # Emacs program and daemon
  programs.emacs.enable = true;
  services.emacs.enable = true;

  home.packages = with pkgs; [
  rust-analyzer
  vscode-fhs
  ];
}
