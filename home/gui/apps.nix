
{ config, lib, pkgs, inputs, ... }:
{

  programs.kitty = {
    
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      include = "~/nix-dotfiles/home/files/kitty/tokyo-night.conf";
      
      background_opacity = "0.93";
      enable_audio_bell = false;
      };

  };


  programs.alacritty.enable = true;

  home.packages = with pkgs; [
    # Browsers
    brave
    firefox
    librewolf
    inputs.zen-browser.packages."${system}".beta-unwrapped


    pdfarranger
    logisim
    kdePackages.kdenlive
    libreoffice
    obs-studio
    gimp # FOSS photoshop
    blender # 3D modeling
    ### broken rn add back later ## anki # Flashcards for language learning
    arduino
    discord
    obsidian
    (calibre.override {
      unrarSupport = true;
    })

    # GUI file browsers
    thunderbird
    pcmanfm
  ];

}
