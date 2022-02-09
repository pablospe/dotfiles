#!/bin/sh

#
# https://github.com/so-fancy/diff-so-fancy
#
wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x diff-so-fancy
mkdir -p bin
cp diff-so-fancy ~/bin

mv .gitconfig ~/backup/.gitconfig
ln -s $(realpath .gitconfig) ~/

