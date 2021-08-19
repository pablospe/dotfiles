#!/bin/sh

mv -f ~/.tmux /tmp

echo "Installing tmux configuration files"

git clone --dept 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp .tmux.conf $HOME/

chmod +x .tmux.theme
cp .tmux.theme $HOME

