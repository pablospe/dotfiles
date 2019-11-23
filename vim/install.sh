#!/bin/sh

# Files to be overwritten
FILES='.vimrc .vim'

# remove ignored files (careful with this)
# git clean -fdX
# rm -fr `cat .gitignore`
# xargs rm -fr < .gitignore


# Create backup
echo Create backup
PATH_BACKUP=~/backup/
echo mkdir -p $PATH_BACKUP
mkdir -p $PATH_BACKUP

for i in $FILES; do
  echo mv ~/$i $PATH_BACKUP
  mv ~/$i $PATH_BACKUP
#   mv ~/$i $PATH_BACKUP 2>/dev/null
done

echo ""
echo Create symbolic links
echo ln -s $PWD ~/.vim
[ -f ~/.vim ] &&  ln -s $PWD ~/.vim

echo ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.vimrc ~/.vimrc

echo ""
echo Installing vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo vim -E +PlugInstall +qall
vim -E +PlugInstall +qall 2>/dev/null
