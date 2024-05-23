{ config, lib, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./network.nix
    ./locale.nix
    ./boot.nix
    ./nix.nix
    ./themes.nix
    ./gui.nix
  ];
}
