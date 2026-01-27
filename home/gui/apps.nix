
{ config, lib, pkgs, inputs, ... }:
{

  programs.kitty = {
    
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      include = "~/.config/kitty/themes/noctalia.conf";
      background_opacity = "0.93";
      enable_audio_bell = false;
      };

  };

  programs.spicetify = {
    enable = true;
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.comfy;
    colorScheme = "Everforest";
  };


  programs.alacritty.enable = true;

  home.packages = with pkgs; [
    # Browsers
    brave
    firefox
    inputs.zen-browser.packages."${system}".beta-unwrapped
    inputs.noctalia.packages."${system}".default

    kicad
    nextcloud-client
    pdfarranger
    logisim
    kdePackages.kdenlive
    libreoffice
    obs-studio
    gimp # FOSS photoshop
    blender # 3D modeling
    ### broken rn add back later ## anki # Flashcards for language learning
    nwg-look
    arduino
    quickshell
    discord
    obsidian
    (calibre.override {
      unrarSupport = true;
    })
    ollama

    # GUI file browsers
    thunderbird
    pcmanfm
  ];

}
