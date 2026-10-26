
{ pkgs, inputs, pkgs-stable, ... }:
{

  programs = {
    kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      settings = {
        include = "~/.config/kitty/themes/noctalia.conf";
        background_opacity = "0.93";
        enable_audio_bell = false;
        };
    };

    spicetify = {
      enable = true;
      theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.themes.comfy;
      colorScheme = "Everforest";
    };

    alacritty.enable = true;
  };

  home.packages = with pkgs; [
    # web browsers
    brave
    (inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (old: {
      makeWrapperArgs = (old.makeWrapperArgs or [ ]) ++ [
      "--prefix" "LD_LIBRARY_PATH" ":" "${pkgs.lib.makeLibraryPath [ pkgs.ffmpeg ]}"
      ];
    }))


    inputs.noctalia.packages."${pkgs.stdenv.hostPlatform.system}".default
    logisim-evolution
    #rcu
    sioyek
    pulseview
    gnome-disk-utility
    pkgs-stable.wineWow64Packages.wayland
    pkgs-stable.ltspice
    kicad
    nextcloud-client
    pdfarranger
    kdePackages.kdenlive
    libreoffice
    obs-studio
    gimp # FOSS photoshop
    blender # 3D modeling
    anki # Flashcards for language learning
    nwg-look
    arduino
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
