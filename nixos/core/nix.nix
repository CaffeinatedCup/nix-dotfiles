{ config, lib, pkgs, ... }:

{
  # Nixy stuff like cachix, flake setting, system packages, and users bc I only have one

  # System packages
  environment.systemPackages = with pkgs; [
     vim
     wget
     brightnessctl
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  programs.dconf.enable = true;

  # Users
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zack = {
    isNormalUser = true;
    description = "zack";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Move this to home manager
      firefox
    ];
  };

  # Cachix stuff
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  # Enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
