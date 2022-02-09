#!/bin/sh

set -euxo pipefail

echo "Install dependencies..."

#
# APT
#
sudo apt install -y mc silversearcher-ag tmux dfc axel fd-find ripgrep vim-gtk3 zsh htop openssh-server fd-find curl


