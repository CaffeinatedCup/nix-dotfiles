{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      # https://github.com/catppuccin/gtk
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };
}
