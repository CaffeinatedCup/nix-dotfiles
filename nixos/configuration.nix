{ config, pkgs, inputs, ... }:

{

  imports =
    [
      ./core
      ./optional/greetd.nix
      ./optional/peripherals.nix
      ./optional/gaming.nix
      ./optional/fonts.nix
      ./optional/desktop.nix
    ];
}
