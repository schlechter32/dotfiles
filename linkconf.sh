#! /bin/bash
REPODIR=$(pwd)

mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux
mkdir -p ~/.config/zellij
mkdir -p ~/.config/wezterm
mkdir -p ~/.config/alacritty
mkdir -p ~/.local/share/fonts/
mkdir -p ~/.gnupg

# nvim conf
ln -sf $REPODIR/.config/nvim/* ~/.config/nvim
# tmux conf
ln -sf $REPODIR/.config/tmux/* ~/.config/tmux
ln -sf $REPODIR/.config/zellij/* ~/.config/zellij
ln -sf $REPODIR/.config/wezterm/* ~/.config/wezterm
ln -sf $REPODIR/.config/alacritty/* ~/.config/alacritty
ln -sf $REPODIR/.config/starship.toml ~/.config/
ln -sf $REPODIR/.zshrc $HOME
ln -sf $REPODIR/.latexmkrc $HOME
ln -sf $REPODIR/nbin/ $HOME
ln -sf $REPODIR/.local/share/fonts/* ~/.local/share/fonts
ln -sf $REPODIR/.gitconfig $HOME
ln -sf $REPODIR/.gnupg/gpg-agent.conf $HOME/.gnupg

if command -v nix &>/dev/null && nix --version &>/dev/null; then
    echo "On nix assuming shelltools already installed"
else
    mkdir -p ~/.ssh
    ln -sf $REPODIR/.ssh/config ~/.ssh/

    if [ $(uname) == "Darwin" ]; then
        echo "On Darwin"

    else

if [[ $(hostname) == *"cnode"* ]]; then
        ln -sf $REPODIR/.gitconfigikr $HOME/.gitconfig
elif [[ $(hostname) == *"pc"* ]]; then

        ln -sf $REPODIR/.gitconfigikr $HOME/.gitconfig
fi
    fi
fi


