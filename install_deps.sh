#!/bin/sh

echo "Install dependencies..."

cd /tmp

# bat
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
sudo dpkg -i bat_0.12.1_amd64.deb
# sudo apt install bat  (ubuntu 19.10)

# fd
wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb
sudo dpkg -i fd_7.4.0_amd64.deb
# sudo apt install fd-find (ubuntu 19.04)

# rg
wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
# sudo apt install ripgrep (Ubuntu Cosmic 18.10)


#
# vim-gnome: +clipboard option
#
sudo apt install vim-gnome mc silversearcher-ag tmux dfc axel



#
# https://github.com/so-fancy/diff-so-fancy
#
wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
cp diff-so-fancy ~/bin

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFXS --pattern '^(Date|added|deleted|modified): '"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

