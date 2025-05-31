{ config, pkgs, ... }:
{
  imports = [
  ./base.nix
  ./files.nix
  ./programs.nix
  ./shells.nix
  ];
}
