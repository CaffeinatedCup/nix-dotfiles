{ config, lib, pkgs, ... }:

{
  # Git, emulators, and rice stuff

  programs.git = {
    enable = true;
    userName = "ChineseFriend101";
    userEmail = "z.degidio159@gmail.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
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
  };

  programs.kitty = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };
}
