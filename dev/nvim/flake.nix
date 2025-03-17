{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        neovim
        git
        fzf
        ripgrep
        lua-language-server # LSP for Lua
        stylua              # Lua formatter
      ];
      shellHook = ''
        echo "*NVIM DEV*"
      '';
    };
  };
}
