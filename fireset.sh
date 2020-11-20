#!/bin/bash
# Colors
_RED=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_CYAN=`tput setaf 6`
_RESET=`tput sgr0`
# printing greetings

echo "${_MAGENTA}Installation Progress....securing the droplet :: started${_RESET}"
echo


sudo ufw enable
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 1883
sudo ufw allow 8883
sudo ufw allow 8083
echo "${_YELLOW}Now the firewall is enabled.${_RESET}"
echo
echo "${_YELLOW} Ports OpenSSH, 80, 1883, 8883, and 8083 are all active.${_RESET}"
echo "${_MAGENTA}Installation Progress....securing the droplet :: completed${_RESET}"