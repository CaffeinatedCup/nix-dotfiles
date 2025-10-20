{ config, lib, pkgs, ... }:

{

  # Note: Default shell set in nix.nix
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "vulch" = {
        hostname = "140.82.6.170";
        user = "zack";
      };
      "liberator" = {
        hostname = "192.168.1.162";
        user = "zack";
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
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls="eza";
      ll="eza -l";
      lt="eza --tree";
      la="eza -la";
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
