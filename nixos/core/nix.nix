{ config, lib, pkgs, ... }:

{
  # Nixy stuff like cachix, flake setting, system packages, and users bc I only have one


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  # Users
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zack = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "zack";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Cachix stuff
  nix.settings = {
    builders-use-substitutes = true;
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://anyrun.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="

    ];
  };


  # Enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # nh, a cli helper for nix commands
  programs.nh = {
    enable = true;
    flake = "/home/zack/nix-dotfiles";
  };


  # System packages
  environment.systemPackages = with pkgs; [
     vim
     wget
     brightnessctl
     hwinfo

    # archives
    zip
    xz
    unzip
    p7zip
    zstd

    # utils
    jq # A lightweight and flexible command-line JSON processor

    # networking tools
    socat # replacement of openbsd-netcat

    # misc
    file
    which
    tree

  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
