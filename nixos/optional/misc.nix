{ config, lib, pkgs, ... }:

{
  # Random packages for personal use

  programs.thunderbird.enable = true;

  environment.systemPackages = with pkgs; [
    gimp # FOSS photoshop
    blender # 3D modeling
    anki # Flashcards for language learning
    gnupg
    obsidian
    memos
    (calibre.override {
      unrarSupport = true;
    })
  ];
}
