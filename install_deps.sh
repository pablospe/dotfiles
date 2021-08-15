#!/bin/sh

echo "Install dependencies..."

cd /tmp

# fd
wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb
sudo dpkg -i fd_7.4.0_amd64.deb
# sudo apt install fd-find (ubuntu 19.04)

# rg
wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
# sudo apt install ripgrep (Ubuntu Cosmic 18.10)


#
# APT
#
sudo apt install mc silversearcher-ag tmux dfc axel
