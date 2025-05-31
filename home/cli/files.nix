{ config, lib, pkgs, ... }:

{
  # File managers, RSS and prob more.

  programs.lf = {
    enable = true;
    # add custom lf commands here too
  };


  programs.newsboat = {
    enable = true;
    urls = [
      {
        url = "https://techcrunch.com/feed";
      }
    ];
  };

  home.packages = with pkgs; [
    pcmanfm # GUI file manager
  ];
}
