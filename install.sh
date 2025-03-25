#! /bin/bash
APPS=$HOME/localapps
REPODIR=$(pwd)
echo $REPODIR

mkdir -p $APPS/apps/
mkdir -p $APPS/bin/
mkdir -p ~/.ssh
ln -sf $REPODIR/nbin/* $APPS/bin
# ln -sf $REPODIR/.zshrc ~

# touch ~/.bashrc_machine_specific.sh
# ln -sf $REPODIR/inputrc ~/.inputrc
# ln -sf $REPODIR/tmux.conf ~/.tmux.conf
# ln -sf $REPODIR/zshrc ~/.zshrc
# ln -sf $REPODIR/nvim ~/.config/nvim
# ln -sf $REPODIR/starship.toml ~/.config/starship.toml
#Installer
if command -v nix &>/dev/null && nix --version &>/dev/null; then
  echo "On nix assuming shelltools already installed"
else
  echo "On random unix x86 system installing shelltools"
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
export PATH="$HOME/.cargo/bin:$PATH"
# bat
cargo-binstall bat
# eza
cargo-binstall eza
#starship
cargo-binstall starship
# fzf
mkdir -p $APPS/apps/fzf
curl -L https://github.com/junegunn/fzf/releases/download/0.53.0/fzf-0.53.0-linux_amd64.tar.gz | tar -xz -C $APPS/apps/fzf
ln -sf $APPS/apps/fzf/fzf $APPS/bin/

# lazgit
mkdir -p $APPS/apps/lazygit
curl -L https://github.com/jesseduffield/lazygit/releases/download/v0.45.2/lazygit_0.45.2_Linux_x86_64.tar.gz | tar -xz -C $APPS/apps/lazygit
ln -sf $APPS/apps/lazygit/lazygit $APPS/bin
# nvim
mkdir -p $APPS/apps/nvim
  curl -L https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz | tar -xz -C $APPS/apps/nvim/ --strip-components=1
ln -sf $APPS/apps/nvim/bin/nvim $APPS/bin/
# ripgrep
cargo-binstall ripgrep
# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# yazi-fm
cargo-binstall yazi-fm
# zellij
mkdir -p $APPS/apps/zellij
curl -L https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz | tar -xz -C $APPS/apps/zellij
ln -sf $APPS/apps/zellij/zellij $APPS/bin
# zoxide
cargo-binstall zoxide
fi
