#!/bin/sh

# Dependencies
# oh my fish
# tmux-plugins (tpm)
# vim-plug
# alacritty

# under ~/
ln -sf ~/src/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/src/dotfiles/tmux.conf ~/.tmux.conf

# under ~/.config
ln -sf ~/src/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/src/dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/src/dotfiles/init.vim ~/.config/nvim/init.vim
