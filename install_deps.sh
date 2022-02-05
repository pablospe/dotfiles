#!/bin/sh

set -euxo pipefail

echo "Install dependencies..."

#
# APT
#
sudo apt install mc silversearcher-ag tmux dfc axel fd-find ripgrep vim-gtk3

