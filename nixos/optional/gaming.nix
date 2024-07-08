{ config, lib, pkgs, ... }:

{
  # Optional file for gaming on nix

  # Steam
  programs.steam.enable = true;

  # To launch a game using these options, add it under launch options with %command%
  # gamemoderun %command%
  programs.steam.gamescopeSession.enable = true;

  # mangohud %command%
  environment.systemPackages = with pkgs; [
    mangohud
  ];

  # gamemode %command%
  programs.gamemode.enable = true;


  # TODO add proton, maybe heroic, and bottles
}
