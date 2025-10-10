{ config, lib, pkgs, ... }:

{
  imports = [
    ./network.nix
    ./locale.nix
    ./nix.nix
  ];
}
