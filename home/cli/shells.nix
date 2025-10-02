{ config, lib, pkgs, ... }:

{

  # Note: Default shell set in nix.nix

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

      export EDITOR=nvim
    fi
      '';

    };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };
}
