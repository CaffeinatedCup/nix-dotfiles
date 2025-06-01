
{ config, lib, pkgs, inputs, ... }:

{

  home.packages = with pkgs; [
    brave
    firefox
    librewolf
    gcc #must move
    inputs.zen-browser.packages."${system}".beta-unwrapped


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
