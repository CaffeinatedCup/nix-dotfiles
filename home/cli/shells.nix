{ config, lib, pkgs, ... }:

{

  # Note: Default shell set in nix.nix
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "vulch" = {
        HostName = "140.82.6.170";
        User = "zack";
      };
      "liberator" = {
        HostName = "100.71.212.63";
        User = "zack";
      };
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    dotDir = config.home.homeDirectory;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls="eza";
      ll="eza -l";
      lt="eza --tree";
      la="eza -la";
      silabs="nix run /home/zack/Code/embedded/arsenal-nexus/Silabs";
    };
    initContent = ''
    if [[ $- == *i* ]] && [[ -z "$IN_NIX_SHELL" ]] && [[ -z "$FASTFETCH_RAN" ]]; then
      export FASTFETCH_RAN=1
      fastfetch

    fi
      export EDITOR=nvim
    '';
    };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
