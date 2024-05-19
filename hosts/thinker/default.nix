## Thinker ##
## Thinkpad x230 running NixOS ##

{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/configuration.nix
  ];

  networking.hostName = "thinker";

}
