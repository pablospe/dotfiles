#!/usr/bin/env bash

# Determine my path
ROOT="`dirname \"$0\"`"           # relative
ROOT="`( cd \"$ROOT\" && pwd )`"  # absolutized and normalized
if [ -z "$ROOT" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi
cd ${ROOT}

mkdir -p $HOME/backup

[ -f $HOME/.tigrc ]  && mv -f $HOME/.tigrc $HOME/backup

echo "Installing tig configuration files"

ln -s $(realpath ${ROOT}/.tigrc) $HOME/.tigrc
