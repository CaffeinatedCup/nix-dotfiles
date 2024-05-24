{ config, lib, pkgs, ... }:

{
  # Git, emulators, and rice stuff
  # TODO add wezterm and configure starship better

  programs.git = {
    enable = true;
    userName = "ChineseFriend101";
    userEmail = "z.degidio159@gmail.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
   # catppuccin.enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
  #  catppuccin.enable = true;
  };

  programs.kitty = {
    enable = true;
  #  catppuccin.enable = true;
  };

#  programs.wezterm = {
#    enable = true;
#  };

  programs.tmux = {
    enable = true;
  };
}
