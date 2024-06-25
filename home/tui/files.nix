{ config, lib, pkgs, ... }:

{
  # File managers, RSS and prob more.

  programs.lf = {
    enable = true;
    # add custom lf commands here too
  };

  programs.yazi.enable = true;

  programs.newsboat.enable = true;

  home.packages = with pkgs; [
    pcmanfm # GUI file manager
  ];
}
