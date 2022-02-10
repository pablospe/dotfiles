#!/usr/bin/env bash

set -euxo pipefail


# Determine my path
ROOT="`dirname \"$0\"`"              # relative
ROOT="`( cd \"$ROOT\" && pwd )`"  # absolutized and normalized
if [ -z "$ROOT" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi
cd ${ROOT}

# dotfiles
${ROOT}/install_deps.sh
${ROOT}/install_gitconfig.sh
${ROOT}/bash/install.sh
${ROOT}/delta/install.sh
${ROOT}/bat/install.sh
# ${ROOT}/ranger/install.sh
# cd ${ROOT}/vim && ${ROOT}/install.sh && cd ${ROOT}
${ROOT}/install_htop_config.sh
${ROOT}/install_tmux.sh
${ROOT}/zsh/install.sh


# Clean up apt.
sudo apt-get autoremove -y
sudo apt-get clean -y
