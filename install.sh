#!/bin/sh

set -euxo pipefail

./install_deps.sh

./install_gitconfig.sh

bash/install.sh

delta/install.sh
bat/install.sh
ranger/install.sh

cd vim
install.sh
cd ..

./install_htop_config.sh

./install_tmux.sh

zsh/install.sh
