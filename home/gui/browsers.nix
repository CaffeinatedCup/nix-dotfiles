{ config, lib, pkgs, inputs, ... }:

{

  home.packages = with pkgs; [
    brave
    firefox
    librewolf
    gcc #must move
    inputs.zen-browser.packages."${system}".beta-unwrapped
  ];

}
