/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
rm -r .config/nvim/custom
brew install luarocks ripgrep stylua lazygit wezterm ccls tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow .
