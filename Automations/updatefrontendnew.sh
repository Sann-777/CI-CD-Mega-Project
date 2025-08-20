#!/bin/bash

# Automatically grab LAN IP
lan_ip=$(hostname -I | awk '{print $1}')

# Path to the .env file
file_to_find="../frontend/.env.docker"
current_url=$(cat $file_to_find)

if [[ "$current_url" != "VITE_API_PATH=\"http://${lan_ip}:31100\"" ]]; then
    if [ -f $file_to_find ]; then
        sed -i -e "s|VITE_API_PATH.*|VITE_API_PATH=\"http://${lan_ip}:31100\"|g" $file_to_find
    else
        echo "ERROR: File not found."
    fi
fi

