

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
mkdir -p  ~/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/homebrew
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
export PATH="$PATH:home/$USER/homebrew/bin"
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
# ~/homebrew/bin/brew install nvim luarocks ripgrep stylua lazygit ccls tmux
# rm -r ~/.config/nvim/custom
~/homebrew/bin/brew install zsh luarocks ripgrep stylua lazygit ccls tmux mc mosh nu bat fzf
~/homebrew/bin/brew install stow
wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz
mkdir -p ~/global/npm
tar -xJvf node-v20.11.0-linux-x64.tar.xz -C ~/global/npm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mv ~/.profile ~/.profile.bak
mv ~/.bashrc ~/.bashrc.bak
mkdir -p ~/.local/share/fonts
/home/$USER/homebrew/bin/stow .
fc-cache -f -v
curl -fsSL https://install.julialang.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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
~/homebrew/bin/brew tap wez/wezterm-linuxbrew
~/homebrew/bin/brew install wezterm
fi
if [[ $platform == 'Darwin' ]]; then
  brew install --cask wezterm
fi
# chsh -s zsh
/home/$USER/homebrew/bin/zsh

