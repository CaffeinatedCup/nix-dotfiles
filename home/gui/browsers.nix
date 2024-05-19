{ config, lib, pkgs, ... }:

{
  # Browsers config packages

  programs.firefox = {
    enable = true;
  };

  programs.librewolf = {
    enable = true;
  };
}
