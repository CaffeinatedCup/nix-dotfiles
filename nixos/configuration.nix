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
      ./optional/syncthing.nix
    ];

  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.deploy-rs.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.ssh-to-age
  ];
}
