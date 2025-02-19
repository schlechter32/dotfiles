#! /bin/bash
REPODIR=$(pwd)

mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux
mkdir -p ~/.config/zellij
mkdir -p ~/.config/wezterm
mkdir -p ~/.config/alacritty
mkdir -p ~/.local/share/fonts

# nvim conf
ln -sf $REPODIR/.config/nvim/* ~/.config/nvim
# tmx conf
ln -sf $REPODIR/.config/tmux/* ~/.config/tmux
ln -sf $REPODIR/.config/zellij/* ~/.config/zellij
ln -sf $REPODIR/.config/alacritty/* ~/.config/alacritty
ln -sf $REPODIR/.config/starship.toml ~/.config/
ln -sf $REPODIR/.zshrc ~
ln -sf $REPODIR/.local/share/fonts/* ~/.local/share/fonts

