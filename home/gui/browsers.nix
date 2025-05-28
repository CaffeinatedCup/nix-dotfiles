{ config, lib, pkgs, inputs, ... }:

{
  # Browsers config packages

  programs.firefox = {
    enable = true;
  };

  programs.librewolf = {
    enable = true;
  };


  home.packages = with pkgs; [
    brave
    gcc #must move
    inputs.zen-browser.packages."${system}".beta-unwrapped
  ];

}
