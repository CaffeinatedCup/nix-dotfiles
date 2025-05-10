{config, pkgs, inputs, ... }:

{

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = inputs.nixCats.packages.${pkgs.system}.neovim-with-my-config.override {
      neovimConfigPath = "${inputs.nvim-config}/.";
    };
  };

  # Emacs program and daemon
  programs.emacs.enable = true;
  services.emacs.enable = true;

  home.packages = with pkgs; [
  rust-analyzer
  vscode-fhs
  ];
}
