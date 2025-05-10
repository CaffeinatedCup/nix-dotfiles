{ config, lib, pkgs, ... }:

{
  # Bash and zsh aliases
  # TODO also add PATH stuff here

  # Note: Default shell set in nix.nix

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nvim-dev = "nvim -u /home/zack/nvim-dotfiles/init.lua";
    };

    initExtra = "
      fastfetch
      ";
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
