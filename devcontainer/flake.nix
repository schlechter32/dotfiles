{
  description = "Devcontainer toolchain";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable-nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { nixpkgs, unstable-nixpkgs, neovim-nightly-overlay, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          neovim-nightly-overlay.overlays.default
          (final: _prev: {
            unstable = import unstable-nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          })
        ];
      };
    in {
      packages.${system}.container-tools = pkgs.buildEnv {
        name = "container-tools";
        paths = with pkgs; [
          bat
          btop
          eza
          fd
          file
          fzf
          git
          git-lfs
          jq
          lazygit
          pass
          python314
          ripgrep
          starship
          tmux
          tmux-sessionizer
          uv
          xclip
          yazi
          zellij
          zoxide
          neovim-nightly-overlay.packages.${system}.default
          unstable.claude-code
          unstable.codex
        ];
      };
    };
}
