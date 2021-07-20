# vimrc

to install:
clone this repo

cd into it
```
brew install neovim/neovim/neovim
ln -s ~/vimrc/init.lua ~/.config/nvim/init.lua
git clone https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim
nvim
:PaqInstall
```
requires gruvbox in your terminal
