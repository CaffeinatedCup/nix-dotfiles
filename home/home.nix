{
  home.username = "zack";
  home.homeDirectory = "/home/zack";

  imports = [
  ./gui/hyprland/hyprland.nix
  ./gui/xdg.nix
  ./tui/base.nix
  ./tui/shells.nix
  ./tui/files.nix
  ./gui/browsers.nix
  ./gui/gtk.nix
  ./editors/base.nix
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
