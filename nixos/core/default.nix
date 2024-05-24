{ config, lib, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./network.nix
    ./locale.nix
    ./boot.nix
    ./nix.nix
    ./desktop.nix
    ./themes.nix
  ];
}
