#!/bin/sh

echo "Install dependencies..."

cd /tmp

# bat
wget https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_amd64.deb
sudo dpkg -i bat_0.18.2_amd64.deb

# fd
wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb
sudo dpkg -i fd_7.4.0_amd64.deb
# sudo apt install fd-find (ubuntu 19.04)

# rg
wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
# sudo apt install ripgrep (Ubuntu Cosmic 18.10)


#
# vim-gnome: +clipboard option
#
sudo apt install mc silversearcher-ag tmux dfc axel

