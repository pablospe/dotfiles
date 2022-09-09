#!/usr/bin/env bash

echo "Install dependencies..."

#
# APT
#
sudo apt-get install -y \
  axel \
  chafa \
  curl \
  dfc \
  exiftool \
  fasd \
  git \
  htop \
  mc \
  openssh-server \
  ripgrep \
  silversearcher-ag \
  tig \
  tree \
  vim-gtk3 \
  xsel \
  zsh

# Latest Tmux (AppImage).
curl -s https://api.github.com/repos/nelsonenzo/tmux-appimage/releases/latest \
| grep "browser_download_url.*appimage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - \
&& chmod +x tmux.appimage
&& sudo mv tmux.appimage /usr/local/bin/tmux

# Latest fd-find.
TMP=$(mktemp -d)
cd $TMP
fd_url=$(curl -s https://api.github.com/repos/sharkdp/fd/releases/latest | grep 'browser_' | cut -d\" -f4 | grep '_amd64' | grep --invert-match 'musl')
wget $fd_url
sudo dpkg -i $(basename $fd_url)
rm -fr $TMP
