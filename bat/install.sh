#!/usr/bin/env bash

BAT_CONF_PATH="$HOME/.config/bat"

# Function to display commands
exe() { echo "\$ $@" ; "$@" ; }

#
# Create backup
#
echo Create backup
BACKUP_PATH=~/backup
# if backup already existed, move to `/tmp/` instead of replacing it (just in case)
if [ -d $BACKUP_PATH/bat ] ; then
  rm -fr /tmp/bat
  exe mv -f $BACKUP_PATH/bat /tmp/
fi

exe mkdir -p $BACKUP_PATH
exe mv -f $BAT_CONF_PATH $BACKUP_PATH/

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
# Note: it assumes `bat` is installed
#
# exe wget https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_amd64.deb -P /tmp
# exe sudo dpkg -i /tmp/bat_0.18.2_amd64.deb
exe sudo apt-get install bat

# Check if bat configuration folder exists.
exe mkdir -p $BAT_CONF_PATH

# Copy bat configuration.
exe cp $MY_PATH/config $BAT_CONF_PATH/config
