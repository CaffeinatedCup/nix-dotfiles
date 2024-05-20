## Virtman ##
## Main computer test vm running NixOS ##

{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/configuration.nix
  ];

  networking.hostName = "virtman";

}
