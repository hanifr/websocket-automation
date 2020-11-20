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

echo "${_MAGENTA}Installation Progress....setup for NGINX block :: started${_RESET}"
echo
sleep 5

# Maintaining the updated version of Certbot
sudo add-apt-repository ppa:certbot/certbot
sudo apt update    
# Install Certbot's Nginx package
sudo apt install python3-certbot-nginx

sleep 5
. fireset.sh
   
echo "${_CYAN}Please Enter your domain_name${_RESET} $_domain"
                read -p "Enter your Domain_name or localhost: " _domain
echo
echo "${_CYAN}You have entered $_domain for your domain name${_RESET}"
echo

sudo mkdir -p /var/www/$_domain/html

sudo chown -R $USER:$USER /var/www/$_domain/html

sudo chmod -R 755 /var/www

#sudo nano /var/www/tron.airmode.live/html/index.html
sudo cat >/var/www/$_domain/html/index.html <<EOL 
<html>
    <head>
        <title>Welcome to TRON!</title>
    </head>
    <body>
        <h1>TRON is working fine!</h1>
    </body>
</html>
EOL

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$_domain

sudo cat >/etc/nginx/sites-available/$_domain <<EOL
server {
        listen 80;
        listen [::]:80;

        root /var/www/$_domain/html;
        index index.html index.htm index.nginx-debian.html;

        server_name $_domain;

        location / {
                try_files $uri $uri/ =404;
        }
}
EOL

sudo nginx -t
grep -R default_server /etc/nginx/sites-enabled/
sudo rm -rf /etc/nginx/sites-enabled/default 
sudo nginx -t
sudo systemctl status nginx

echo "${_YELLOW}Now the Nginx block is enabled.${_RESET}"
echo
echo "${_YELLOW} websocket framework is ready for use.${_RESET}"
echo "${_MAGENTA}Installation Progress....setup for NGINX block :: completed${_RESET}"
sleep 5
# Get Let's Encrypt certificate for example.com
#sudo certbot --nginx -d $_domain
sudo certbot certonly --standalone --preferred-challenges http -d $_domain
. websock.sh 
sleep 5