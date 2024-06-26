{ config, lib, pkgs, ... }:

{
  stylix.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";
  stylix.image = /home/zack/current-wallpaper/land.png;

  stylix.opacity.terminal = 0.9;

  stylix.targets.grub.enable = false;
 
  home-manager.sharedModules = [{
  stylix.targets.emacs.enable = false;
  }];
    
}
