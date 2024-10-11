#!/bin/sh

# Dependencies
# oh my fish
# tmux-plugins (tpm)
# lazy.nvim (auto)

# under ~/
ln -sf ~/Developer/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/Developer/dotfiles/tmux.conf ~/.tmux.conf

mkdir ~/.config
mkdir ~/.config/alacritty
mkdir ~/.config/fish
mkdir ~/.config/nvim

# under ~/.config
ln -sf ~/Developer/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/Developer/dotfiles/config.fish ~/.config/fish/config.fish
# ln -sf ~/Developer/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/Developer/dotfiles/init.lua ~/.config/nvim/init.lua

