#!/bin/sh

rm -fr /tmp/.tmux
mv -f $HOME/.tmux /tmp
mv -f $HOME/.tmux.conf ~/backup
mv -f $HOME/.tmux.theme ~/backup

echo "Installing tmux configuration files"

git clone --dept 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s $(realpath .tmux.conf) $HOME/.tmux.conf

chmod +x .tmux.theme
ln -s $(realpath .tmux.theme) $HOME/.tmux.theme
