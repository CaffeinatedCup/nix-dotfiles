{pkgs, pkgs-unstable, ... }:

{
  # TODO add nix code to integrate neovim config here


  # Add any editors here
  home.packages = with pkgs; [
  neovim
  emacs #instructions to add doom in directory
  ];
}
