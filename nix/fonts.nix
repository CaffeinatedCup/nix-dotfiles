{pkgs, ... }:

{

  fonts = {
  fontDir.enable = true;

  packages = with pkgs; [

  material-design-icons
  font-awesome
  nerdfonts
  ];
  };

}
