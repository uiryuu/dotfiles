#!/bin/sh

# Dependencies
# oh my fish
# tmux-plugins (tpm)
# vim-plug

# under ~/
ln -sf ~/src/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/src/dotfiles/tmux.conf ~/.tmux.conf
if [ "$(uname)" == "Darwin" ]; then
    ln -sf ~/src/dotfiles/Brewfile ~/Brewfile
fi

mkdir ~/.config
mkdir ~/.config/alacritty
mkdir ~/.config/fish
mkdir ~/.config/nvim

# under ~/.config
ln -sf ~/src/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/src/dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/src/dotfiles/init.vim ~/.config/nvim/init.vim

