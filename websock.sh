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

echo "${_CYAN}Installation Progress....MQTT Mosquitto :: started${_RESET}"
echo

# Installation of MQTT Mosquitto dependencies
sudo apt install mosquitto mosquitto-clients
sleep 5
systemctl restart mosquitto
echo "${_MAGENTA}Please do the following${_RESET}"
echo "${_CYAN}\"sudo mosquitto_passwd -c /etc/mosquitto/passwd your_username\"${_RESET}"
echo
echo "${_CYAN}\"then enter your password\"${_RESET}"
echo
echo "${_CYAN}Please Enter your domain_name${_RESET} $_domain"
                read -p "Enter your Domain_name or localhost: " _domain
echo
echo "${_CYAN}You have entered $_domain for your domain name${_RESET}"
echo


# start doing stuff: preparing MQTT Mosquitto
# preparing script background work and work under reboot
echo "[*] Creating mosquitto systemd service"

cat >/tmp/custom.conf <<EOL
allow_anonymous true
#password_file /etc/mosquitto/passwd

listener 1883 $_domain

listener 8883
certfile /etc/letsencrypt/live/$_domain/cert.pem
cafile /etc/letsencrypt/live/$_domain/chain.pem
keyfile /etc/letsencrypt/live/$_domain/privkey.pem
        
listener 8083
protocol websockets
certfile /etc/letsencrypt/live/$_domain/cert.pem
cafile /etc/letsencrypt/live/$_domain/chain.pem
keyfile /etc/letsencrypt/live/$_domain/privkey.pem
EOL
sudo mv /tmp/custom.conf /etc/mosquitto/conf.d/custom.conf
chmod +x $HOME/websocket-automation/mosq_back.sh
. mosq_back.sh
echo "${_CYAN}Now MQTT Mosquitto will be according to your domain name $_domain${_RESET}"
echo
echo "To see MQTT Mosquitto status run \"sudo systemctl status mosquitto\" command"
echo "${_YELLOW}The apps is now running on background${_RESET}"

echo
echo "${_YELLOW}Please execute \"mosquitto_sub -d -h localhost -t test\" to test the apps.${_RESET}"
echo
echo "${_YELLOW}head to \"cd /etc/mosquitto/conf.d/custom.conf\" and change${_RESET}"
echo
echo "${_YELLOW}\"localhost to domain\" if you have one${_RESET}"
echo
echo "${_YELLOW}Execute \"sudo systemctl status mosquitto\" to check the operation status${_RESET}"
echo
echo "${_MAGENTA}Installation Progress....MQTT Mosquitto :: completed${_RESET}"
