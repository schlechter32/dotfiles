# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
mkdir -p  ~/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/homebrew
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
rm -r .config/nvim/custom
brew install luarocks ripgrep stylua lazygit ccls tmux
brew install stow


platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='Darwin'
fi
# if [[ $platform == 'linux' ]]; then
#    alias ls='ls --color=auto'
# elif [[ $platform == 'freebsd' ]]; then
#    alias ls='ls -G'
# fi
if [[ $platform == 'linux' ]]; then
brew tap wez/wezterm-linuxbrew
brew install wezterm
fi
if [[ $platform == 'Darwin' ]]; then
  brew install --cask wezterm
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow .
