#!/bin/bash

function curl-install () {
        apt update -y && apt install curl -y
}

function nginx-change-config () {
        rm -f /etc/nginx/sites-available/default && mkdir -p /var/www/bootcamp_aca && curl https://transfer.sh/get/QX7UuX/bootcamp_aca.conf > /etc/nginx/sites-available/default
}

function nginx-restart () {
        systemctl restart nginx
}

if [[ $USER != root ]] 
then    
        echo "Permission denied: run script as root"
else
        curl-install && nginx-change-config && nginx-restart
fi
