git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
rm -r .config/nvim/custom
stow .
