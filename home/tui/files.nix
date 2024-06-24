{ config, lib, pkgs, ... }:

{
  # File managers and prob more

  programs.lf = {
    enable = true;
    # add custom lf commands here too
  };

  programs.yazi.enable = true;

 # programs.thunar = {
 #  enable = true;
    #add plugins here too
 # };
}
