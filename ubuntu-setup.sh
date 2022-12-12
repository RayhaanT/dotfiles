#!/bin/bash

# install packages
sudo apt install git build-essential cmake curl fish tmux neovim python3 unzip nodejs
#Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install alacritty

# Set fish to default and omf
chsh -s $(which fish)
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install bobthefish

# JetBrains Mono font
curl "https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*b546cd*_ga*NTMyMjA0OTc2LjE2NTc5ODQxMzg.*_ga_9J976DJZ68*MTY2MTMwNjcwOC4yLjEuMTY2MTMwNjgyMC4wLjAuMA..&_ga=2.198538282.485427551.1661306709-532204976.1657984138" -L --output jetbrains-mono.zip
unzip jetbrains-mono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -f -v

# tmux powerline
git clone https://github.com/erikw/tmux-powerline.git

dotfilesDir = $(pwd)
# Symlinking
cd ~/.config
ln -s $dotfilesDir/nvim/ nvim
ln -s $dotfilesDir/alacritty alacritty
ln -s $dotfilesDir/fish fish
ln -s $dotfilesDir/fish fish
cd ~
ln $dotfilesDir/tmux/.tmux.conf .tmux.conf
ln $dotfilesDir/tmux/.tmux-powerlinerc .tmux-powerlinerc

# Git config
git config --global user.email "tanweer.rayhaan@gmail.com"
git config --global user.name "Rayhaan Tanweer"

# Set default editor (requires user input)
sudo update-alternatives --config editor
