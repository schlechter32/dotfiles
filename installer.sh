# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
rm -r .config/nvim/custom
brew install luarocks ripgrep stylua lazygit ccls tmux
brew install --cask wezterm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow .
