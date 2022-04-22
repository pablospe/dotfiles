#!/usr/bin/env bash

# Function to display commands.
exe() { echo "\$ $@" ; "$@" ; }

# Backup.
mkdir -p $HOME/backup
[ -f $HOME/.delta.gitconfig ] && mv -f $HOME/.delta.gitconfig $HOME/backup

#
# Determine my path.
#
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1
fi

#
# Installation
#
VERSION="0.12.1"
wget "https://github.com/dandavison/delta/releases/download/${VERSION}/git-delta-musl_${VERSION}_amd64.deb" -P /tmp
sudo dpkg -i "/tmp/git-delta-musl_${VERSION}_amd64.deb"

# Copy delta configuration.
exe ln -s $MY_PATH/delta.gitconfig $HOME/.delta.gitconfig
