#! /bin/bash
REPODIR=$(pwd)

mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux
mkdir -p ~/.config/zellij
mkdir -p ~/.config/wezterm

# nvim conf
ln -sf $REPODIR/.config/nvim/* ~/config/nvim
# tmx conf
ln -sf $REPODIR/.config/tmux/* ~/config/tmux
ln -sf $REPODIR/.config/zellij/* ~/config/zellij

