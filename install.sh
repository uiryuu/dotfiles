#!/bin/sh

# Dependencies
# oh my fish
# tmux-plugins (tpm)
# lazy.nvim (auto)

# under ~/
ln -sf ~/src/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/src/dotfiles/tmux.conf ~/.tmux.conf

mkdir ~/.config
mkdir ~/.config/alacritty
mkdir ~/.config/fish
mkdir ~/.config/nvim

# under ~/.config
ln -sf ~/src/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/src/dotfiles/config.fish ~/.config/fish/config.fish
# ln -sf ~/src/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/src/dotfiles/init.lua ~/.config/nvim/init.lua

