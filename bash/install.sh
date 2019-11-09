#!/bin/sh

# Files to be overwritten
FILES='.bash .fzf .bash-git-prompt'

# Create backup
echo Create backup
PATH_BACKUP=~/backup/
echo mkdir -p $PATH_BACKUP
mkdir -p $PATH_BACKUP

for i in $FILES; do
  rm -fr ${PATH_BACKUP}/$i
  echo mv ~/$i $PATH_BACKUP
  mv ~/$i $PATH_BACKUP 2>/dev/null
done
cp ~/.bashrc $PATH_BACKUP/.bashrc

#
# Determine my path
#
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

mkdir -p $HOME/.bash

#
# fzf
#
rm -fr ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
~/.fzf/install
cp ${MY_PATH}/fzf.sh $HOME/.bash/

echo '' >>~/.bashrc
echo '# fzf settings' >>~/.bashrc
echo 'source $HOME/.bash/fzf.sh' >>~/.bashrc

#
# bash-git-prompt
#
rm -fr ~/.bash-git-prompt
git clone --depth 1 https://github.com/pablospe/bash-git-prompt.git ~/.bash-git-prompt --depth=1
cp ${MY_PATH}/git-prompt-conf.sh $HOME/.bash/
echo '' >>~/.bashrc
echo '# bash-git-prompt' >>~/.bashrc
echo 'source $HOME/.bash/git-prompt-conf.sh' >>~/.bashrc

#
# share history
#
cp ${MY_PATH}/share_history.sh $HOME/.bash/
echo '' >>~/.bashrc
echo '# share history' >>~/.bashrc
echo 'source $HOME/.bash/share_history.sh' >>~/.bashrc

#
# https://github.com/trapd00r/LS_COLORS
#
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
echo '' >>~/.bashrc
echo '# LS_COLORS' >>~/.bashrc
echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.bashrc
