{ config, lib, pkgs, ... }:

{
  # Bash and zsh aliases
  # TODO add zsh, zsh completion and alias stuff
  # TODO also add PATH stuff here

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
    };
  };
}
