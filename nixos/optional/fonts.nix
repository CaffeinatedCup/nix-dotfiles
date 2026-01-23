{pkgs, ... }:

{

  # Cursors too
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];

  fonts = {
  fontDir.enable = true;

  packages = with pkgs; [

  iosevka
  jetbrains-mono
  fira-code
  material-design-icons
  adwaita-icon-theme
  font-awesome
  nerd-fonts._0xproto
  nerd-fonts.droid-sans-mono
  ];
  };

}
