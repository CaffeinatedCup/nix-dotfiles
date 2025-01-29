{pkgs, ... }:

{

  fonts = {
  fontDir.enable = true;

  packages = with pkgs; [

  iosevka
  jetbrains-mono
  fira-code
  material-design-icons
  font-awesome
  nerd-fonts._0xproto
  nerd-fonts.droid-sans-mono
  ];
  };

}
