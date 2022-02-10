#!/bin/sh

rm -fr /tmp/.tmux
[ -f $HOME/.tmux ]       && mv -f $HOME/.tmux       /tmp
[ -f $HOME/.tmux.conf ]  && mv -f $HOME/.tmux.conf  ~/backup
[ -f $HOME/.tmux.theme ] && mv -f $HOME/.tmux.theme ~/backup

echo "Installing tmux configuration files"

git clone --dept 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s $(realpath .tmux.conf) $HOME/.tmux.conf
ln -s $(realpath .tmux.theme) $HOME/.tmux.theme
