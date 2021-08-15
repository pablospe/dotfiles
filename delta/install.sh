#!/usr/bin/env bash

# Function to display commands
exe() { echo "\$ $@" ; "$@" ; }

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
wget https://github.com/dandavison/delta/releases/download/0.8.3/git-delta-musl_0.8.3_amd64.deb -P /tmp
sudo dpkg -i /tmp/git-delta_0.8.3_amd64.deb

# Copy delta configuration.
exe cp $MY_PATH/delta.gitconfig $HOME/.delta.gitconfig
