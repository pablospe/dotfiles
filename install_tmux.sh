#!/bin/sh

echo "Installing tmux configuration files"

git clone --dept 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp .tmux.conf $HOME/

chmod +x base16.sh 
cp base16.sh $HOME/

