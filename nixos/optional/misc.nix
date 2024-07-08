{ config, lib, pkgs, ... }:

{
  # Random packages for personal use
  environment.systemPackages = with pkgs; [
    gimp # FOSS photoshop
    blender # 3D modeling
    anki # Flashcards for language learning
    gnupg
  ];
}
