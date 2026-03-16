curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
fisher install jorgebucaran/fisher oh-my-fish/theme-bobthefish oh-my-fish/plugin-brew
# make the dirs to prevent stow from linking the folders
mkdir .config/nvim .config/alacritty .config/fish
stow . --dotfiles
