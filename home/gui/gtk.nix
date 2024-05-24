{ config, pkgs, ... }:

{
  gtk.enable = true;
  gtk.theme.package = pkgs.rose-pine-gtk-theme;
  gtk.theme.name = "rose-pine";
}
