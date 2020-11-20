#!/bin/bash
# Colors
_RED=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_CYAN=`tput setaf 6`
_RESET=`tput sgr0`

VERSION=2.0

echo "Installation of Node-Red, Mosquitto and security setup for Digitalocean Droplet v$VERSION."
echo "${_GREEN}(please report issues to tronexia@gmail.com email with full output of this script with extra \"-x\" \"bash\" option)${_RESET}"

if [ "$(id -u)" == "0" ]; then
  echo "WARNING: Generally it is not adviced to run this script under root"
fi

if [ -z $HOME ]; then
  echo "ERROR: Please define HOME environment variable to your home directory"
  exit 1
fi

if [ ! -d $HOME ]; then
  echo "ERROR: Please make sure HOME directory $HOME exists"
  exit 1
fi

echo "${_CYAN}Installation Progress....${_RESET}"

# Adding privilage to setup files
chmod +x $HOME/websocket-automation/nginx.sh
chmod +x $HOME/websocket-automation/fireset.sh
chmod +x $HOME/websocket-automation/nginx_block.sh
chmod +x $HOME/websocket-automation/websock.sh
. nginx.sh 
sleep 5
echo "${_YELLOW}To setup websocket framework please \"./nginx_block.sh\".${_RESET}"
echo