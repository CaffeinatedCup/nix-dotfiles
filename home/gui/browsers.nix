{ config, lib, pkgs, ... }:

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
  ];

}
