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
wget http://archive.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
sudo dpkg -i $MY_PATH/exa_0.9.0-4_amd64.deb

