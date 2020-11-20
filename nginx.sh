#!/bin/bash
# Colors
_CYAN=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_GREEN=`tput setaf 6`
_RESET=`tput sgr0`

echo "${_MAGENTA}Installation Progress....Nginx :: Started${_RESET}"
sudo apt update
sudo apt install nginx
sudo ufw allow 'Nginx HTTP'
sudo systemctl reload nginx
sudo systemctl enable nginx
sleep 5
echo
echo "${_GREEN}Avoid any possible hash bucket memory problem do the following${_RESET}"
echo
echo "${_GREEN}Execute \"sudo nano /etc/nginx/nginx.conf\"${_RESET}"
echo
echo "${_GREEN}Uncomment the line \"server_names_hash_bucket_size\"${_RESET}"
echo " ..."
echo " http {"
echo "     ..."
echo "      \"server_names_hash_bucket_size 64;\""
echo "     ..."
echo "    }"
echo
echo "${_GREEN}Once finish, hit ctrl + o to save and ctrl + x to exit${_RESET}"
echo
echo "${_MAGENTA}Installation Progress....Nginx :: Completed${_RESET}"