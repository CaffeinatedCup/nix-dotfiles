
{ config, pkgs, ... }:
{
  imports = [
  ./apps.nix
  ./hyprland.nix
  ./gtk.nix
  ./xdg.nix
  ];
}
