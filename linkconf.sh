#! /bin/bash
REPODIR=$(pwd)

mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux
mkdir -p ~/.config/zellij
mkdir -p ~/.config/wezterm
mkdir -p ~/.local/share/fonts/

# nvim conf
ln -sf $REPODIR/.config/nvim/* ~/.config/nvim
# tmux conf
ln -sf $REPODIR/.config/tmux/* ~/.config/tmux
ln -sf $REPODIR/.config/zellij/* ~/.config/zellij
ln -sf $REPODIR/.config/wezterm/* ~/.config/wezterm
ln -sf $REPODIR/.config/starship.toml ~/.config/
ln -sf $REPODIR/.gitconfig $HOME
ln -sf $REPODIR/.zshrc $HOME
ln -sf $REPODIR/.local/share/fonts/* ~/.local/share/fonts


