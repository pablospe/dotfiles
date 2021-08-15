#!/usr/bin/env bash

RANGE_CONF_PATH="$HOME/.config/ranger"

# Function to display commands
exe() { echo "\$ $@" ; "$@" ; }

#
# Create backup
#
echo Create backup
BACKUP_PATH=~/backup
# if backup already existed, move to `/tmp/` instead of replacing it (just in case)
if [ -d $BACKUP_PATH/ranger ] ; then
  rm -fr /tmp/ranger
  exe mv -f $BACKUP_PATH/ranger /tmp/
fi

exe mkdir -p $BACKUP_PATH
exe mv -f $RANGE_CONF_PATH $BACKUP_PATH/

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
exe sudo apt-get install ranger caca-utils atool w3m poppler-utils mediainfo ffmpegthumbnailer

# Check if ranger configuration folder exists.
exe mkdir -p $RANGE_CONF_PATH

# Copy range configuration.
exe cp $MY_PATH/rc.conf $RANGE_CONF_PATH

# Copy scope.sh to `~/.config/ranger`.
exe ranger --copy-config=scope

# Apply patch for previews.
# Note: this might need adjustments for the newerst ranger versions.
exe eval "patch $RANGE_CONF_PATH/scope.sh < $MY_PATH/scope.sh.patch"
