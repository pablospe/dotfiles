#!/usr/bin/env bash

RANGE_CONF_PATH="$HOME/.config/ranger"

#
# Create backup
#
echo Create backup
BACKUP_PATH=~/backup
# if backup already existed, move to `/tmp/` instead of replacing it (just in case)
if [ -d $BACKUP_PATH/ranger ] ; then
  rm -fr /tmp/ranger
  echo mv -f $BACKUP_PATH/ranger /tmp/
  mv -f $BACKUP_PATH/ranger /tmp/
fi

echo mkdir -p $BACKUP_PATH
mkdir -p $BACKUP_PATH
echo mv -f $RANGE_CONF_PATH $BACKUP_PATH/
mv -f $RANGE_CONF_PATH $BACKUP_PATH/

#
# Determine my path
#
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1
fi

#
# installation
#
echo sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo ffmpegthumbnailer
sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo ffmpegthumbnailer

# check if ranger configuration folder exists
echo mkdir -p $RANGE_CONF_PATH
mkdir -p $RANGE_CONF_PATH

# copy range configuration
echo cp $MY_PATH/rc.conf $RANGE_CONF_PATH/
cp $MY_PATH/rc.conf $RANGE_CONF_PATH

# copy scope.sh to `~/.config/ranger`
echo ranger --copy-config=scope
ranger --copy-config=scope

# apply patch for previews
echo patch $RANGE_CONF_PATH/scope.sh < $MY_PATH/scope.sh.patch  # this might need adjustments for the newerst ranger versions
patch $RANGE_CONF_PATH/scope.sh < $MY_PATH/scope.sh.patch  # this might need adjustments for the newerst ranger versions
