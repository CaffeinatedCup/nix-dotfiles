{config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
  vscode-fhs
  inputs.nvim-config.packages.${system}.nvim
  ];
}
